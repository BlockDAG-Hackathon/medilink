import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_app/ui/btn.dart';
import 'package:hackathon_app/ui/input.dart';
import 'package:hugeicons/hugeicons.dart';

class CreatePasswordScreen extends StatelessWidget {
  const CreatePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: HugeIcon(
          icon: HugeIcons.strokeRoundedExchange01,
          color: Colors.white,
          size: 20,
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            "assets/backgrounds/background.png",
            width: Get.width,
            height: Get.height,
            fit: BoxFit.cover,
            opacity: const AlwaysStoppedAnimation(1.0),
          ),
          SafeArea(
            child: Container(
              padding: EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 10,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Text(
                        "Create a password",
                        style: GoogleFonts.poppins(
                          color: Color(0xFFFFFFFF),
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "You will use this to unlock your account",
                        style: GoogleFonts.poppins(
                          color: Color(0xFF8C8C8C),
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Input(
                    hintText: "Enter your email/username",
                    isPassword: false,
                  ),
                  Input(hintText: "Enter your password", isPassword: true),
                  GestureDetector(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Checkbox(
                          value: false,
                          onChanged: (value) {},
                          checkColor: Colors.white,
                          activeColor: Colors.white,
                        ),
                        Text(
                          "I agreed to the ",
                          style: GoogleFonts.poppins(
                            color: Color(0xFF494D58),
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          " Terms of Services",
                          style: GoogleFonts.poppins(
                            color: Color(0xFFFFFFFF),
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Btn(
                    onClick: () {},
                    label: "Continue",
                    fontWeight: FontWeight.w600,
                    bgColor: Colors.white,
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
