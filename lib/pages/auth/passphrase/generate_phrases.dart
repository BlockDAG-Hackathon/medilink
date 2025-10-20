import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_app/routes/app_routes.dart';

import 'package:hackathon_app/ui/btn.dart';
import 'package:hackathon_app/ui/deep_blue_gradient_background.dart';
import 'package:hugeicons/hugeicons.dart';

class GeneratePhrasesScreen extends GetView {
  const GeneratePhrasesScreen({super.key});

  // Define the padding and spacing constants once
  static const double horizontalContainerPadding = 30.0;
  static const double wrapItemSpacing = 10.0;

  List<String> get recoveryWords {
    final arguments = Get.arguments as Map<String, dynamic>?;
    final seedPhrase = arguments?['seedPhrase'] as String?;

    if (seedPhrase != null && seedPhrase.isNotEmpty) {
      return seedPhrase.split(' ');
    }

    // Fallback to placeholder words if no seed phrase is provided
    return List.generate(12, (index) => "word ${index + 1}");
  }

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
        title: Text(
          "Secret Phrase",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18,
            fontFamily: GoogleFonts.poppins.toString(),
          ),
        ),
        centerTitle: true,
        actionsPadding: EdgeInsets.only(top: 20, right: 20),
        actions: [
          Icon(Icons.error, color: Colors.white.withValues(alpha: 0.2)),
        ],
      ),
      body: Stack(
        children: [
          DeepBlueGradientBackground(),
          Container(
            // Apply padding ONLY once on the parent container
            padding: EdgeInsets.symmetric(
              horizontal: horizontalContainerPadding,
              vertical: Get.height * 0.1,
            ),
            child: Column(
              children: [
                SizedBox(height: Get.height * 0.03),

                LayoutBuilder(
                  builder: (context, constraints) {
                    final double totalWidth = constraints.maxWidth;

                    final double spaceForTwoItems =
                        totalWidth - wrapItemSpacing;

                    final double itemWidth = spaceForTwoItems / 2;

                    return Wrap(
                      spacing: wrapItemSpacing,
                      runSpacing:
                          wrapItemSpacing, // Use a named constant for clarity
                      children: recoveryWords.asMap().entries.map((entry) {
                        final int index = entry.key;
                        final String word = entry.value;
                        final int displayNumber = index + 1; // 1-based index

                        return Container(
                          // Use the calculated width
                          width: itemWidth,

                          padding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 8,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0x1AFFFFFF),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            // Fixed the invalid 'spacing: 2' property in Row
                            children: [
                              Text(
                                displayNumber.toString().padLeft(
                                  2,
                                  '0',
                                ), // Ensure 0-padding
                                style: TextStyle(
                                  color: const Color(0xFFD9D9D9),
                                  fontFamily: GoogleFonts.poppins.toString(),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ), // Standard spacing in Row
                              Expanded(
                                // Ensure the word wraps
                                child: Text(
                                  word,
                                  softWrap: true,
                                  style: TextStyle(
                                    color: const Color(0xFFD9D9D9),
                                    fontFamily: GoogleFonts.poppins.toString(),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),

                GestureDetector(
                  onTap: () async {
                    final seedPhrase = recoveryWords.join(' ');
                    await Clipboard.setData(ClipboardData(text: seedPhrase));
                    Get.snackbar(
                      'Copied!',
                      'Seed phrase copied to clipboard',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.green.withValues(alpha: 0.8),
                      colorText: Colors.white,
                      duration: Duration(seconds: 2),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      spacing: 10,
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        HugeIcon(
                          icon: HugeIcons.strokeRoundedCopy01,
                          color: Color(0x80FFFFFF),
                          size: 25,
                        ),
                        Text(
                          "Copy to clipboard",
                          style: TextStyle(
                            color: Color(0x80FFFFFF),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: GoogleFonts.poppins.toString(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(flex: 1),
                Container(
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Color(0x1AFFEA07),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    spacing: 10,
                    children: [
                      Icon(Icons.error, color: Color(0xFFFFEA07), size: 20),
                      Expanded(
                        child: Text(
                          "Do not share your secret phrase with anyone, and store it securely.",
                          softWrap: true,
                          style: TextStyle(
                            color: Color(0xFFFFEA07),
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            fontFamily: GoogleFonts.poppins.toString(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Btn(
                  onClick: () {
                    // Pass the seed phrase to the next screen for confirmation
                    final arguments = Get.arguments as Map<String, dynamic>?;
                    Get.toNamed(
                      AppPages.confirmPhrase,
                      arguments: {
                        'seedPhrase': recoveryWords.join(' '),
                        'walletAddress': arguments?['walletAddress'],
                      },
                    );
                  },
                  label: "Continue",
                  textColor: Color(0xFF041679),
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
