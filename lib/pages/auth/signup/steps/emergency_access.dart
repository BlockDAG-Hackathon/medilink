import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_app/controllers/signup_controller.dart';


class EmergencyAccess extends StatelessWidget {
  EmergencyAccess({super.key});

  // Get the existing controller instance instead of creating a new one
  final SignupController controller = Get.find<SignupController>();

  // Text editing controllers
  final TextEditingController allergiesController = TextEditingController();
  final TextEditingController emergencyContactController =
      TextEditingController();
  final TextEditingController existingConditionsController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // 1. Progress Indicator
        const SizedBox(height: 48),

        // 2. Title and Subtitle
        Text(
          "Emergency Access",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "Who can view your medical data in an emergency.",
          style: GoogleFonts.poppins(
            color: Colors.white54,
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
        ),

        SizedBox(height: Get.height * 0.05),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children:
              [
                "My assigned doctor",
                "Emergency responders",
                "Family member ",
              ].map<Widget>((item) {
                return GestureDetector(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF041679),
                            fontSize: 17.7,
                          ),
                        ),
                        Icon(Icons.check, color: Color(0xFF041679), size: 20),
                      ],
                    ),
                  ),
                );
              }).toList(),
        ),
      ],
    );
  }
}
