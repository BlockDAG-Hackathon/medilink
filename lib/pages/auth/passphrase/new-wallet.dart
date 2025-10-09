import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:hackathon_app/ui/btn.dart';
import 'package:hackathon_app/ui/deep_blue_gradient_background.dart';

class NewWalletScreen extends StatelessWidget {
  const NewWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(top: 25, left: 25),
          child: GestureDetector(
            onTap: () => Get.back(),
            child: Icon(Icons.arrow_back, size: 20, color: Colors.white),
          ),
        ),
        actions: [
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(left: 25),
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
              decoration: BoxDecoration(
                color: Color(0x80041679),
                borderRadius: BorderRadius.circular(2),
              ),
              child: Text(
                "Skip",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),

      body: Stack(
        children: [
        DeepBlueGradientBackground(),
          Column(
            children: [
              Image.asset("assets/ui/backup.png"),
              SizedBox(height: Get.height * 0.65),
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
              SizedBox(height: Get.height * 0.5),

              Text(
                "Protect your medical data by backing up your seed phrase now",
                style: TextStyle(
                  color: Color(0xFF8C8C8C),
                  fontFamily: GoogleFonts.poppins.toString(),
                  fontSize: 16,
                ),
              ),
              SizedBox(height: Get.height * 1),
              Btn(
                onClick: () {},
                label: "Backup manually",
                fontWeight: FontWeight.w500,
              ),
              Spacer(flex: 2),
            ],
          ),
        ],
      ),
    );
  }
}
