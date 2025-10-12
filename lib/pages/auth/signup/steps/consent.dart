import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_app/controllers/signup_controller.dart';

class Consent extends StatelessWidget {
  Consent({super.key});

  // Get the existing controller instance
  final SignupController controller = Get.find<SignupController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(height: 48),
        
        // Green checkmark circle
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: const Color(0xFF90EE90), // Light green
            borderRadius: BorderRadius.circular(60),
          ),
          child: const Icon(
            Icons.check,
            color: Color(0xFF32CD32), // Darker green for the checkmark
            size: 60,
          ),
        ),
        
        SizedBox(height: Get.height * 0.06),
        
        // Title
        Text(
          "Consent and Data\nProtection",
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF041679), // Dark blue
            height: 1.2,
          ),
        ),
        
        const SizedBox(height: 24),
        
        // Description text
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "I agree to securely store and share my data according to ISO/NIST cybersecurity standards and allow authorised medics to access it in emergency",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.grey[600],
              height: 1.5,
            ),
          ),
        ),
        
        SizedBox(height: Get.height * 0.04),
        
        // Checkbox with terms agreement
        Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => controller.termsAccepted.toggle(),
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: controller.termsAccepted.value 
                      ? const Color(0xFF041679) 
                      : Colors.transparent,
                  border: Border.all(
                    color: const Color(0xFF041679),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: controller.termsAccepted.value
                    ? const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 16,
                      )
                    : null,
              ),
            ),
            const SizedBox(width: 12),
            Flexible(
              child: RichText(
                text: TextSpan(
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                  children: [
                    const TextSpan(text: "I agreed to the "),
                    TextSpan(
                      text: "Terms",
                      style: GoogleFonts.poppins(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const TextSpan(text: " and "),
                    TextSpan(
                      text: "Security Policy",
                      style: GoogleFonts.poppins(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )),
        
        SizedBox(height: Get.height * 0.04),
        
        // Accept & Continue button
        Obx(() => Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: ElevatedButton(
            onPressed: controller.termsAccepted.value 
                ? () {
                    // Handle accept and continue
                    controller.nextStep();
                  }
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF041679),
              disabledBackgroundColor: Colors.grey[300],
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
            ),
            child: Text(
              "Accept & Continue",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: controller.termsAccepted.value 
                    ? Colors.white 
                    : Colors.grey[600],
              ),
            ),
          ),
        )),
      ],
    );
  }
}