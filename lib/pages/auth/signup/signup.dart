import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:hackathon_app/pages/auth/signup/steps/emergency_access.dart';
import '../../../controllers/signup_controller.dart';
import '../../../pages/auth/signup/steps/medical_info.dart';
import '../../../pages/auth/signup/steps/welcome.dart';
import '../../../ui/btn.dart';
import '../../../ui/dropdown.dart';
import '../../../ui/input.dart';

class ProgressDots extends StatelessWidget {
  final int totalSteps;
  final int currentStep;

  const ProgressDots({
    super.key,
    required this.totalSteps,
    required this.currentStep,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(totalSteps, (index) {
        bool isActive = index < currentStep;
        return Expanded(
          child: Container(
            // width: 30,
            height: 5,
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            decoration: BoxDecoration(
              color: isActive
                  ? const Color(0xFF4C7FFF)
                  : const Color(0xFF555555),
              borderRadius: BorderRadius.circular(2.5),
            ),
          ),
        );
      }),
    );
  }
}

/// Custom dropdown field to match the style of the Input widget.

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  // Initialize the controller
  final SignupController controller = Get.put(SignupController());

  // Text editing controllers (mocked for demonstration)
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController contactController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Dark background to match the Input widget aesthetic
    const screenBackgroundColor = Color(0xFF121212);

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: Get.height * 0.06,
            horizontal: 20,
          ),
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            children: [
              // Progress Dots
              Obx(
                () => ProgressDots(
                  totalSteps: 5,
                  currentStep: controller.activeIndex.value + 1,
                ),
              ),

              const SizedBox(height: 20),

              // Main Content Area
              Expanded(
                child: SingleChildScrollView(
                  child: Obx(() => _buildCurrentStep()),
                ),
              ),

              const SizedBox(height: 20),

              // Continue Button
              Obx(
                () => Btn(
                  onClick: () => _handleContinue(),
                  label: _getButtonLabel(),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCurrentStep() {
    switch (controller.activeIndex.value) {
      case 0:
        return const Welcome();
      case 1:
        return MedicalInfo();
      case 2:
        return _buildPersonalInfoStep();
      case 3:
        return EmergencyAccess();
      default:
        return const Welcome();
    }
  }

  Widget _buildPersonalInfoStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 48),

        // Title and Subtitle
        Text(
          "Let's get to know you",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "Your privacy is our top priority.",
          style: GoogleFonts.poppins(
            color: Colors.white54,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),

        const SizedBox(height: 40),

        _buildLabel('Full Name'),
        Input(
          hintText: 'Enter your full name',
          controller: nameController,
          keyboardType: TextInputType.name,
          onChanged: (value) => controller.fullName.value = value,
        ),

        const SizedBox(height: 24),

        // Date of Birth
        _buildLabel('Date of Birth'),
        Input(
          hintText: 'MM/DD/YYYY',
          controller: dobController,
          keyboardType: TextInputType.datetime,
          suffixIcon: Icons.calendar_today_outlined,
          onChanged: (value) => controller.dateOfBirth.value = value,
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
        _buildLabel('Contact Email or Phone'),
        Input(
          hintText: 'Enter email or phone',
          controller: contactController,
          keyboardType: TextInputType.emailAddress,
          suffixIcon: Icons.alternate_email,
          onChanged: (value) => controller.contactInfo.value = value,
        ),
      ],
    );
  }

  void _handleContinue() {
    if (controller.activeIndex.value < 3) {
      controller.activeIndex.value += 1;
    } else {
      // Complete signup process
      Get.offAllNamed("/home");
    }
  }

  String _getButtonLabel() {
    if (controller.activeIndex.value < 2) {
      return "Continue";
    } else {
      return "Complete Signup";
    }
  }

  // Helper function for the form field labels
  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          color: const Color(0xFFEEEEEE),
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
