import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_app/routes/app_routes.dart';
import 'package:hackathon_app/ui/background.dart';
import 'package:hackathon_app/ui/btn.dart';

class NewWalletScreen extends StatelessWidget {
  const NewWalletScreen({super.key});

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
            child: Icon(Icons.arrow_back, size: 30, color: Colors.white),
          ),
        ),
      ),

      body: Stack(
        children: [
          Background(),
          Padding(
            padding:  EdgeInsets.symmetric(vertical: Get.height*0.1, horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                Image.asset(
                  "assets/ui/backup.png",
                  fit: BoxFit.contain,
                  width: Get.width * 0.8,
                  height: Get.width * 0.9,
                ),
                // SizedBox(height: Get.height * 0.65),
                Text(
                  "Back up secret phrase",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: GoogleFonts.poppins.toString(),
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),

                // SizedBox(height: Get.height * 0.05),
                Text(
                  "Protect your medical data by backing up your seed phrase now",
                  style: TextStyle(
                    color: Color(0xFF8C8C8C),
                    fontFamily: GoogleFonts.poppins.toString(),
                    fontSize: 16,
                  ),
                ),
                Spacer(flex: 1),
                Btn(
                  onClick: () {
                    Get.toNamed(AppPages.confirmBackup);
                  },
                  label: "Backup manually",
                  fontWeight: FontWeight.w500,
                ),
                Spacer(flex: 2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
