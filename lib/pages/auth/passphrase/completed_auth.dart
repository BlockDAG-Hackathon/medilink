import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_app/constants/utils.dart';
import 'package:hackathon_app/routes/app_routes.dart';
import 'package:hackathon_app/ui/btn.dart';
import 'package:hackathon_app/ui/deep_blue_gradient_background.dart';

class CompletedAuthScreen extends GetView<CompletionController> {
  const CompletedAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize controller if not already done
    Get.put(CompletionController());

    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(top: 25, left: 25),
          child: GestureDetector(
            onTap: () => Get.back(),
            child: Icon(Icons.arrow_back, size: 20, color: Colors.white),
          ),
        ),
      ),
      body: Stack(
        children: [
          DeepBlueGradientBackground(),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 20,
              children: [
                Image.asset(
                  "assets/ui/reg-success.png",
                  width: Get.width * 0.4,
                  height: Get.width * 0.4,
                ),
                Obx(
                  () => Text(
                    Utils.completionsData[controller.activeIndex.value]['title'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontFamily: GoogleFonts.poppins.toString(),
                    ),
                  ),
                ),
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      Utils.completionsData[controller.activeIndex.value]['desc'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF8c8c8c),
                        fontFamily: GoogleFonts.poppins.toString(),
                        height: 1.5,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: Get.height * 0.07),
                Obx(
                  () => Btn(
                    onClick: () {
                      controller.handleContinue();
                    },
                    label: Utils
                        .completionsData[controller.activeIndex.value]['label'],
                    fontWeight: FontWeight.w500,
                    textColor: Color(0xFF030D43),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CompletionController extends GetxController {
  final activeIndex = 0.obs;

  void handleContinue() {
    if (activeIndex.value < Utils.completionsData.length - 1) {
      // Move to next completion step
      activeIndex.value += 1;
    } else {
      // Completed all steps, navigate to home
      Get.toNamed(AppPages.signup);
    }
  }

  void goToStep(int step) {
    if (step >= 0 && step < Utils.completionsData.length) {
      activeIndex.value = step;
    }
  }

  void reset() {
    activeIndex.value = 0;
  }

  bool get isLastStep => activeIndex.value >= Utils.completionsData.length - 1;

  String get currentTitle => Utils.completionsData[activeIndex.value]['title'];
  String get currentDesc => Utils.completionsData[activeIndex.value]['desc'];
  String get currentLabel => Utils.completionsData[activeIndex.value]['label'];
}
