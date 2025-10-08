import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_app/routes/app_routes.dart';
import 'package:hackathon_app/ui/background.dart';
import 'package:hackathon_app/ui/btn.dart';
import '../../../ui/input.dart';
import "package:hugeicons/hugeicons.dart";

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left:25, top: 20),
          child: Icon(
             Icons.arrow_back,
            color: Colors.white,
            size: 25,
          ),
        ),
        
      ),
      body: Stack(
        children: [
          Background(),
          Container(
            padding: EdgeInsets.symmetric(horizontal:25, vertical: Get.height*0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20,
              children: [
                Column(
                  spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Access your secure Medical service",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      "Your medical data is encrypted and secured safely on BlockDAG chain",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                
                Input(hintText: "Enter private key", isPassword: false),
                Input(hintText: "Enter password", isPassword: true),
                SizedBox(height: Get.height * 0.005),
                Row(
                  spacing: 20,
                  children: [
                    Expanded(
                      child: Btn(
                        onClick: () {},
                        label: "Log in",
                        fontWeight: FontWeight.w600,
                        bgColor: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppPages.home);
                      },
                      child: Icon(
                        Icons.qr_code_scanner,
                        color: Colors.white,
                        size: 60,
                      ),
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
