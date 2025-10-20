import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_app/routes/app_routes.dart';
import 'package:hackathon_app/ui/btn.dart';
import 'package:hackathon_app/ui/deep_blue_gradient_background.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  Widget _buildCustomInput(String hintText, bool isPassword) {
    final RxBool obscureText = isPassword.obs;

    return Obx(() {
      return Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(
            0.4,
          ), // Black background with 40% opacity
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white.withOpacity(0.5))
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
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 25, top: 20),
          child: GestureDetector(
            onTap: () => Get.back(),
            child: Icon(Icons.arrow_back, color: Colors.white, size: 25),
          ),
        ),
      ),
      body: Stack(
        children: [
          // Background(),
          DeepBlueGradientBackground(),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 25,
              vertical: Get.height * 0.1,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20,
              children: [
                Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/ui/login.png",
                      width: double.infinity,
                      height: Get.width * 0.7,
                    ),
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
                      "Your medical data is encrypted and secured safely on MediLink chain",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),

                // _buildCustomInput("Enter private key", false),
                Btn(
                  onClick: () {
                    Get.toNamed(AppPages.seedPhraseIntro);
                  },
                  label: "Connect Wallet",
                  fontWeight: FontWeight.w500,
                  fontSize: 19.99,
                ),
                _buildCustomInput("Enter password", true),
                SizedBox(height: Get.height * 0.005),
                SizedBox(
                  width: Get.width*0.5,
                  child: Btn(
                    onClick: () {},
                    label: "Unlock",
                    fontWeight: FontWeight.w500,
                    bgColor: Colors.white,
                  ),
                ),
                Row(
                  spacing: Get.width * 0.04,

                  children: [
                    Expanded(
                      child: Container(height: 1.5, color: Color(0xFFFFFFFF)),
                    ),
                    Text(
                      "Or Sign up with",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                      ),
                    ),
                    Expanded(
                      child: Container(height: 1.5, color: Color(0xFFFFFFFF)),
                    ),
                  ],
                ),

                Row(
                  spacing: Get.width * 0.05,

                  children: [
                    Expanded(
                      child: Btn(
                        onClick: () {},
                        label: "Google",
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        textColor: Colors.white,
                        icon: Icons.facebook,
                        backgroundless: true,
                      ),
                    ),
                    Expanded(
                      child: Btn(
                        onClick: () {},
                        label: "Facebook",
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        textColor: Colors.white,
                        icon: Icons.facebook,
                        backgroundless: true,
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
