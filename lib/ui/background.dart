import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/backgrounds/background.png",
      width: Get.width,
      height: Get.height,
      fit: BoxFit.cover,
      opacity: const AlwaysStoppedAnimation(1.0),
    );
  }
}
