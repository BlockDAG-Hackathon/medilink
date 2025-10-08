import 'dart:async';
import 'package:get/get.dart';
import 'package:hackathon_app/routes/app_routes.dart';

class SplashController extends GetxController {
  void startTimer() {
    Timer(const Duration(milliseconds: 3000), () {
     Get.offNamed(AppPages.onboarding);
    });
  }

  @override
  void onInit() {
    super.onInit();
     startTimer();
  }

  @override
  void onReady() {
    super.onReady();
     }
}
