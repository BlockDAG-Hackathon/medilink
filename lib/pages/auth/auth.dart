import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_app/routes/app_routes.dart';
import 'package:hackathon_app/ui/btn.dart';
import 'package:hackathon_app/ui/deep_blue_gradient_background.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});

  // final WalletController walletController = Get.put(WalletController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: Stack(
        children: [
          DeepBlueGradientBackground(),
          Container(
            padding: EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: Get.width * 0.05,
              children: [
                Image.asset(
                  "assets/ui/auth.png",
                  width: double.infinity,
                  // height: Get.width * 0.5,
                ),
                Text(
                  "Create a New Wallet",
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Generate a secure wallet to access you data",
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Btn(
                  onClick: () {
                    Get.toNamed(AppPages.seedPhraseIntro);
                  },
                  label: "Connect Wallet",
                  fontWeight: FontWeight.w500,
                  fontSize: 19.99,
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
                Row(
                  spacing: 5,
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text(
                      "Already have an account?",
                      style: GoogleFonts.poppins(color: Colors.white54),
                    ),
                    GestureDetector(
                      child: Text(
                        "Log in",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
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
