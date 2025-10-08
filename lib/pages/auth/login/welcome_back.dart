import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_app/constants/utils.dart';
import 'package:hackathon_app/ui/background.dart';
import 'package:hackathon_app/ui/btn.dart';

class CompletedAuthScreen extends GetView {
  const CompletedAuthScreen({super.key});

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
          Background(),
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
                    "Welcome back",
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
                      "Your account is now ready to use. Dive and start your medical journey. Stay safe!",
                      textAlign: TextAlign.center,
                      softWrap: true,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      color: Color(0xFFFFFFFF),
                      constraints: BoxConstraints(maxHeight: 30, maxWidth: 30),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
