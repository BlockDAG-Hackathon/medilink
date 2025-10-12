import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackathon_app/routes/app_routes.dart';
import 'package:hackathon_app/ui/btn.dart';
import 'package:hackathon_app/controllers/wallet_controllers.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});

  final WalletController walletController = Get.put(WalletController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/backgrounds/background.png",
            width: Get.width,
            height: Get.height,
            fit: BoxFit.cover,
            opacity: const AlwaysStoppedAnimation(1.0),
          ),
          Container(
            padding: EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              spacing: Get.width * 0.05,
              children: [
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
                Obx(
                  () => Btn(
                    onClick:(){
                      Get.toNamed(AppPages.signup);
                    },
                    label: walletController.isLoading.value
                        ? "Connecting..."
                        : "Connect Wallet",
                    fontWeight: FontWeight.w500,
                    fontSize: 19.99,
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
                SizedBox(height: Get.height * 0.1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
