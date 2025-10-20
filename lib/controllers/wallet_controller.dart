import 'package:get/get.dart';
import 'package:reown_appkit/reown_appkit.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'dart:developer' as developer;

class WalletController extends GetxController {
  late ReownAppKitModal appKitModal;
  static final Dio _dio = Dio();

  RxBool isConnected = false.obs;
  RxString walletAddress = ''.obs;
  RxString sessionTopic = ''.obs;
  RxBool isGeneratingSeedphrase = false.obs;

  // Your backend API endpoints
  static const String _backendUrl = 'https://your-backend-api.com';
  static const String _walletConnectEndpoint = '/wallet/connect';

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
    appKitModal.onModalConnect.subscribe((ModalConnect? event) async {
      if (event == null) return;

      developer.log("ModalConnect event: $event");
      String chainId = event.session.chainId;
      final namespace = ReownAppKitModalNetworks.getNamespaceForChainId(
        chainId,
      );
      String? address = event.session.getAddress(namespace);

      String topic = appKitModal.session?.topic ?? '';

      // update local state
      walletAddress.value = address ?? "";
      sessionTopic.value = topic;
      isConnected.value = true;

      // Optionally, request a signature from client to prove ownership
      String nonce = await _fetchNonceFromBackend(address ?? "");
      String signature = await appKitModal.request(
        topic: topic,
        chainId: chainId,
        request: SessionRequestParams(
          method: 'personal_sign',
          params: [nonce, address],
        ),
      );
      await _sendToBackendOnConnect(address ?? "", chainId, signature, topic);
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


  void loginWithWallet ()async {
    appKitModal.openModalView();
    appKitModal.onModalConnect.subscribe((ModalConnect? event){
        
    });
  }
  Future<String> _fetchNonceFromBackend(String address) async {
    final resp = await _dio.post(
      '$_backendUrl\$ _walletConnectEndpoint/nonce',

      data: {'address': address},
      options: Options(headers: {'Content-Type': 'application/json'}),
    );
    if (resp.statusCode == 200) {
      final data = resp.data;
      return data['nonce'];
    }
    throw Exception('Failed to fetch nonce');
  }

  Future<void> _sendToBackendOnConnect(
    String address,
    String chainId,
    String signature,
    String topic,
  ) async {
    isGeneratingSeedphrase.value = true;

    final resp = await _dio.post(
      '$_backendUrl$_walletConnectEndpoint',
      data: {
        'address': address,
        'chain_id': chainId,
        'signature': signature,
        "sessionTopic": topic,
      },
      options: Options(headers: {'Content-Type': 'application/json'}),
    );

    isGeneratingSeedphrase.value = false;

    if (resp.statusCode == 200) {
      // backend responds with seedphrase or a token or whatever
      final data = resp.data;
      String seedphrase = data['seedphrase'];
      // store safely / show UI to user
    } else {
      // handle error
      developer.log('Backend error ${resp.statusCode}: ${resp.data}');
    }
  }

  Future<void> connect() async {
    try {
      await appKitModal.connectSelectedWallet();
    } catch (e) {
      print("Error opening AppKit modal: $e");
    }
  }

  Future<void> disconnect() async {
    try {
      await appKitModal.disconnect();
    } catch (e) {
      print("Error disconnecting: $e");
    }
  }
}
