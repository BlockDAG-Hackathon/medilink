import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_app/routes/app_routes.dart';
import 'package:hackathon_app/ui/btn.dart';
import 'package:hackathon_app/ui/deep_blue_gradient_background.dart';

class ConfirmSeedPhrasesScreen extends GetView {
  const ConfirmSeedPhrasesScreen({super.key});
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
          "Confirm Secret Phrase",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18,
            fontFamily: GoogleFonts.poppins.toString(),
          ),
        ),
        centerTitle: true,
        actionsPadding: EdgeInsets.only(top: 20, right: 20),
        actions: [Icon(Icons.error, color: Colors.white.withOpacity(0.2))],
      ),
      body: Stack(
        children: [
          DeepBlueGradientBackground(),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 25,
              vertical: Get.height * 0.1,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: Get.height * 0.03,
              children: [
                SizedBox(height: 10,),
                Text(
                  "Please tap on the correct answer of the below seed phrases.",
                  softWrap: true,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: GoogleFonts.poppins.toString(),
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                ...List.generate(
                  5,
                  (index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10,
                    children: [
                      Text(
                        "Words #${index + 1}",
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontFamily: GoogleFonts.poppins.toString(),
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          height: 1.4,
                        ),
                      ),
                      Row(
                        spacing: 15,
                        children: ["Jackal", "Sparrow", "Arrow"].map<Widget>((
                          item,
                        ) {
                          return Expanded(
                            child: GestureDetector(
                              onTap: () {
                                // Handle word selection
                                print(
                                  "Selected: $item for position ${index + 1}",
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 18,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.2),
                                    width: 1,
                                  ),
                                ),
                                child: Text(
                                  item,
                                  style: TextStyle(
                                    color: Color(0xFFD9D9D9),
                                    fontFamily: GoogleFonts.poppins.toString(),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    height: 1.4,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                Spacer(flex: 1),
                Btn(
                  onClick: () {
                    Get.toNamed(AppPages.completeWalletAuth);
                  },
                  label: "Continue",
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: Get.height * 0.1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
