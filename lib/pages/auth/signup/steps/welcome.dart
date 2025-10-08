import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(height: 48),
        
        Container(
          width: Get.width * 0.4,
          height: Get.width * 0.4,
          decoration: BoxDecoration(
            color: const Color(0x80041679),
            borderRadius: BorderRadius.circular(Get.width * 1),
          ),
          child: const Icon(
            Icons.security,
            color: Colors.white,
            size: 80,
          ),
        ),
        
        SizedBox(height: Get.height * 0.08),
        
        Text(
          "Welcome to BlockDAG",
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        
        const SizedBox(height: 16),
        
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Your health data, protected by blockchain security. Take control of your medical records with confidence.",
            textAlign: TextAlign.center,
            softWrap: true,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: Colors.white70,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }

 
}
