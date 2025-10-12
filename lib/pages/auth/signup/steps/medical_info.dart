import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_app/controllers/signup_controller.dart';
import '../widgets/input.dart';
import '../../../../ui/dropdown.dart';

class MedicalInfo extends StatelessWidget {
  MedicalInfo({super.key});

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
          "Medical Information",
          style: GoogleFonts.poppins(
            color: Color(0xFF041679),
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "All information is securely encrypted.",
          style: GoogleFonts.poppins(
            color: Color(0xFF041679),
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
        ),

        const SizedBox(height: 40),

        _buildLabel('Blood Group'),
        CustomDropdown(
          controller: controller,
          labelText: "Select Blood Group",
          type: DropdownType.bloodGroup,
        ),

        const SizedBox(height: 24),

        // Allergies
        _buildLabel('Allergies'),
        Input(
          hintText: 'e.g., Peanuts, Shellfish',
          controller: allergiesController,
          onChanged: (value) => controller.allergies.value = value,
        ),
        const SizedBox(height: 24),

        // Existing conditions
        _buildLabel('Existing conditions'),
        Input(
          hintText: 'e.g., Asthma, Diabetes',
          controller: existingConditionsController,
          onChanged: (value) => controller.existingConditions.value = value,
        ),

        const SizedBox(height: 24),

        // Gender (Using the custom dropdown)
        CustomDropdown(
          controller: controller,
          labelText: 'Gender',
          type: DropdownType.gender,
        ),

        const SizedBox(height: 24),

        // Contact Email or Phone
        _buildLabel('Emergency contact Phone'),
        Input(
          hintText: '(+234) 9199 9999 99',
          controller: emergencyContactController,
          onChanged: (value) => controller.emergencyContact.value = value,
        ),
      ],
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}




