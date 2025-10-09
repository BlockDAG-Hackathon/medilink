import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_app/constants/utils.dart';
import 'package:hackathon_app/routes/app_routes.dart';
import 'package:hackathon_app/ui/btn.dart';
import 'package:hackathon_app/ui/deep_blue_gradient_background.dart';

class SecretPhraseIntroScreen extends GetView {
  const SecretPhraseIntroScreen({super.key});
  @override
  Widget build(BuildContext context) {
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
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  // Scrollable content area
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 40),
                          
                          // Image section
                          Container(
                            constraints: BoxConstraints(
                              maxHeight: Get.height * 0.25,
                              maxWidth: Get.width * 0.6,
                            ),
                            child: Image.asset(
                              "assets/ui/confirm-backup.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                          
                          const SizedBox(height: 30),
                          
                          // Title
                          Text(
                            "This secret phrase is the master key to your wallet",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              height: 1.3,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          
                          const SizedBox(height: 16),

                          // Subtitle
                          Text(
                            "Tap on all checkboxes to confirm you understand the importance of your secret phrase",
                            style: GoogleFonts.poppins(
                              color: const Color(0xFF8C8C8C),
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                              height: 1.4,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          
                          const SizedBox(height: 30),

                          // Phrase checks
                          Column(
                            children: Utils.phraseChecks
                                .map<Widget>(
                                  (item) => Container(
                                    margin: const EdgeInsets.only(bottom: 12),
                                    padding: const EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      color: const Color(0x1AFFFFFF),
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: Colors.white.withOpacity(0.1),
                                        width: 1,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.check_circle_outline,
                                          size: 20,
                                          color: Colors.white.withOpacity(0.7),
                                        ),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: Text(
                                            item,
                                            style: GoogleFonts.poppins(
                                              color: const Color(0xFFD9D9D9),
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                              height: 1.4,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                          
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                  
                  // Fixed button at bottom
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20, top: 10),
                    child: Btn(
                      onClick: () {
                        Get.toNamed(AppPages.generatePassphrase);
                      },
                      label: "Continue",
                      bgColor: const Color(0xFF4C7FFF),
                      textColor: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
