import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackathon_app/controllers/splash_controllers.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Ensure controller is initialized
    final SplashController controller = Get.find<SplashController>();

    print("SplashScreen: Building splash screen...");

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              "assets/backgrounds/background.png",
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(color: Colors.black);
              },
            ),
          ),
          // Logo
          Center(
            child: Image.asset(
              "assets/vectors/splash.png",
              width: Get.width * 0.7,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.security, size: 100, color: Colors.white);
              },
            ),
          ),
        ],
      ),
    );
  }
}
