import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reown_appkit/reown_appkit.dart';
import 'package:dio/dio.dart';
import 'dart:developer' as developer;

class WalletController extends GetxController {
  late ReownAppKitModal appKitModal;
  static final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
      sendTimeout: Duration(seconds: 10),
    ),
  );

  RxBool isConnected = false.obs;
  RxString walletAddress = ''.obs;
  RxString sessionTopic = ''.obs;
  RxBool isGeneratingSeedphrase = false.obs;

  // Your backend API endpoints
  static const String _backendUrl = 'http://10.0.2.2:4000';
  static const String _generateSeedPhraseEndpoint =
      '/api/wallet/generate-seedphrase';

  @override
  void onInit() {
    super.onInit();
    _initAppKit();
  }

  void _initAppKit() {
    appKitModal = ReownAppKitModal(
      context: Get.context!,
      projectId: "5450ae9f230b533c4d92febefd37863b",
      metadata: const PairingMetadata(
        name: "MyApp",
        description: "Description",
        url: "https://myapp.com",
        icons: ["https://myapp.com/icon.png"],
        redirect: Redirect(
          native: "myapp://",
          universal: "https://myapp.com/callback",
          linkMode: true,
        ),
      ),
      featuresConfig: FeaturesConfig(
        // etc.
      ),
    );
    appKitModal.init();
  }

  void onWalletConnection() {
    appKitModal.openModalView();
    appKitModal.onModalConnect.subscribe((ModalConnect? event) async {
      if (event == null) return;

      String chainId = event.session.chainId;
      final namespace = NamespaceUtils.getNamespaceFromChain(chainId);
      String? address = event.session.getAddress(namespace);

      String topic = appKitModal.session?.topic ?? '';

      // update local state
      walletAddress.value = address ?? "";
      sessionTopic.value = topic;
      isConnected.value = true;

      // Skip signature for now to avoid hanging
      developer.log('Wallet connected, generating seed phrase...');
      await _sendToBackendOnConnect(address ?? "", chainId, "", topic);
    });

    appKitModal.onModalDisconnect.subscribe((ModalDisconnect? event) {
      // reset state
      isConnected.value = false;
      walletAddress.value = '';
      sessionTopic.value = '';
    });

    appKitModal.onModalError.subscribe((ModalError? err) {
      developer.log("Modal error: $err");
    });
  }

  void loginWithWallet() async {
    appKitModal.openModalView();
    appKitModal.onModalConnect.subscribe((ModalConnect? event) {});
  }

  Future<void> _sendToBackendOnConnect(
    String address,
    String chainId,
    String signature,
    String topic,
  ) async {
    isGeneratingSeedphrase.value = true;

    try {
      final url = '$_backendUrl$_generateSeedPhraseEndpoint';

      final resp = await _dio.post(
        url,
        data: {
          'address': address,
          'chain_id': chainId,
          'signature': signature,
          "sessionTopic": topic,
        },
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      isGeneratingSeedphrase.value = false;
      debugPrint("response:  ${resp.data}");

      if (resp.statusCode == 200 || resp.statusCode == 201) {
        final data = resp.data;
        String seedPhrase = data['seedPhrase'];

        // Navigate to GeneratePhrasesScreen with the seed phrase
        Get.toNamed(
          '/passphrase/generate-passphrase',
          arguments: {'seedPhrase': seedPhrase, 'walletAddress': address},
        );
      } else {
        developer.log('Backend error ${resp.statusCode}: ${resp.data}');
        Get.snackbar(
          'Error',
          'Failed to generate seed phrase. Please try again.',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      isGeneratingSeedphrase.value = false;

      developer.log('Network error: $e');
      Get.snackbar(
        'Network Error',
        'Unable to connect to server. Please check your connection.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> connect() async {
    try {
      await appKitModal.connectSelectedWallet();
    } catch (e) {
      developer.log("Error opening AppKit modal: $e");
    }
  }

  Future<void> disconnect() async {
    try {
      await appKitModal.disconnect();
    } catch (e) {
      developer.log("Error disconnecting: $e");
    }
  }

  // Test backend connectivity
  Future<void> testBackendConnection() async {
    try {
      developer.log('Testing backend connection to: $_backendUrl');
      final resp = await _dio.get('$_backendUrl/health');
      developer.log('Backend response: ${resp.statusCode}');
      Get.snackbar(
        'Success',
        'Backend is reachable',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      developer.log('Backend connection failed: $e');
      Get.snackbar(
        'Backend Error',
        'Cannot reach backend: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  // Test API endpoint
  Future<void> testApiEndpoint() async {
    try {
      developer.log('Testing API endpoint: $_backendUrl/api/test');
      final resp = await _dio.post(
        '$_backendUrl/api/test',
        data: {'address': 'test-address', 'chain_id': '1', 'test': true},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      developer.log('API test response: ${resp.statusCode} - ${resp.data}');
      Get.snackbar(
        'API Test Success',
        'Response: ${resp.data}',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      developer.log('API test failed: $e');
      Get.snackbar(
        'API Test Error',
        'Error: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  // Method to generate seed phrase directly (can be called from UI)
  Future<void> generateSeedPhrase() async {
    if (walletAddress.value.isEmpty) {
      Get.snackbar(
        'Error',
        'Please connect your wallet first',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    isGeneratingSeedphrase.value = true;

    try {
      final resp = await _dio.post(
        '$_backendUrl$_generateSeedPhraseEndpoint',
        data: {
          'address': walletAddress.value,
          'chain_id': '1', // Default to Ethereum mainnet
        },
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      isGeneratingSeedphrase.value = false;

      if (resp.statusCode == 200 || resp.statusCode == 201) {
        final data = resp.data;
        String seedPhrase = data['seedPhrase'];

        // Navigate to GeneratePhrasesScreen with the seed phrase
        Get.toNamed(
          '/passphrase/generate-passphrase',
          arguments: {
            'seedPhrase': seedPhrase,
            'walletAddress': walletAddress.value,
          },
        );
      } else {
        developer.log('Backend error ${resp.statusCode}: ${resp.data}');
        Get.snackbar(
          'Error',
          'Failed to generate seed phrase. Please try again.',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      isGeneratingSeedphrase.value = false;
      developer.log('Network error: $e');
      Get.snackbar(
        'Network Error',
        'Unable to connect to server. Please check your connection.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
