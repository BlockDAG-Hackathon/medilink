import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_app/routes/app_routes.dart';
import 'package:hackathon_app/ui/btn.dart';
import 'package:hackathon_app/ui/deep_blue_gradient_background.dart';
import 'package:hugeicons/hugeicons.dart';

class CreatePasswordScreen extends StatelessWidget {
  const CreatePasswordScreen({super.key});

  Widget _buildCustomInput(String hintText, bool isPassword) {
    final RxBool obscureText = isPassword.obs;

    return Obx(() {
      return Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(
            0.4,
          ), // Black background with 40% opacity
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        child: TextField(
          obscureText: obscureText.value,
          style: GoogleFonts.poppins(
            color: Colors.white, // White text for visibility on dark background
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: GoogleFonts.poppins(
              color: Colors.white.withOpacity(
                0.6,
              ), // Semi-transparent white hint
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
            border: InputBorder.none,
            suffixIcon: isPassword
                ? GestureDetector(
                    onTap: () => obscureText.value = !obscureText.value,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(
                        obscureText.value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: Colors.white.withOpacity(0.7),
                        size: 24,
                      ),
                    ),
                  )
                : null,
            suffixIconConstraints: const BoxConstraints(
              minWidth: 0,
              minHeight: 0,
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: HugeIcon(
          icon: HugeIcons.strokeRoundedExchange01,
          color: Colors.white,
          size: 20,
        ),
      ),
      body: Stack(
        children: [
          DeepBlueGradientBackground(),
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
                  _buildCustomInput("Password", true),
                  SizedBox(height: 10),
                  _buildCustomInput("Confirm your password", true),
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
                    onClick: () {
                      Get.toNamed(AppPages.signup);
                    },
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
