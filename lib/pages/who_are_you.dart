import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_app/routes/app_routes.dart';
import 'package:hackathon_app/ui/deep_blue_gradient_background.dart';
import 'package:hackathon_app/controllers/user_controller.dart';
import 'package:hugeicons/hugeicons.dart';

class WhoAreYouScreen extends StatefulWidget {
  const WhoAreYouScreen({super.key});

  @override
  State<WhoAreYouScreen> createState() => _WhoAreYouScreenState();
}

class _WhoAreYouScreenState extends State<WhoAreYouScreen> {
  int? selectedOption;

  @override
  Widget build(BuildContext context) {
    final screenHeight = Get.height;
    final userController = Get.put(UserController());

    return Scaffold(
      body: Stack(
        children: [
          const DeepBlueGradientBackground(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  // Image Section
                  SizedBox(
                    height: screenHeight * 0.25,
                    child: Center(
                      child: Image.asset(
                        "assets/ui/who.png",
                        width: Get.width * 0.8,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.03),

                  // Title
                  Text(
                    "What best describe you",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 28,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 10),

                  // Subtitle
                  Text(
                    "This will help us tailor your experience",
                    style: GoogleFonts.poppins(
                      color: Colors.white.withValues(alpha: 0.7),
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: screenHeight * 0.04),

                  // Options Container with fixed height
                  Container(
                    // padding: EdgeInsets.only(bottom: 10),
                    color: Colors.transparent,
                    child: Column(
                      spacing: 12,
                      children: [
                        ...List.generate(options.length, (index) {
                          final option = options[index];
                          final isSelected = selectedOption == index;

                          return Container(
                            width: double.infinity,
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedOption = index;
                                  });
                                },
                                borderRadius: BorderRadius.circular(16),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 18,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? Colors.white.withValues(alpha: 0.1)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.white.withValues(alpha: 0.3),
                                      width: isSelected ? 2 : 1,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: option["iconBg"],
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                          child: SizedBox(
                                            width: 20,
                                            height: 20,
                                            child:
                                                option["icon"].runtimeType ==
                                                    IconData
                                                ? Icon(
                                                    option["icon"],
                                                    color: Colors.white,
                                                    size: 20,
                                                  )
                                                : HugeIcon(
                                                    icon:
                                                        option["icon"]
                                                            as List<
                                                              List<dynamic>
                                                            >,
                                                    color: Colors.white,
                                                    size: 20,
                                                    strokeWidth: 2,
                                                  ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: Text(
                                          option["text"],
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),

                  // Fixed spacing before button
                  SizedBox(height: screenHeight * 0.1),

                  // Continue Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (selectedOption != null ) {
                          // Store user type selection
                          userController.setUserType(
                            options[selectedOption!]["text"],
                          );
                          Get.toNamed(AppPages.auth);
                        } else {
                          return;
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: selectedOption != null
                            ? const Color(0xFF041679)
                            : Colors.grey[600],
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 2,
                        shadowColor: Colors.white.withValues(alpha: 0.3),
                      ),
                      child: Text(
                        "Continue",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  // Bottom padding for safe area
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<Map<String, dynamic>> get options => [
  {
    "icon": HugeIcons.strokeRoundedDoctor01,
    "text": "Doctor",
    "iconBg": const Color(0xFF4A90E2), // Blue background for doctor
  },
  {
    "icon": HugeIcons.strokeRoundedPatient,
    "text": "Patient",
    "iconBg": const Color(0xFF50C878), // Green background for patient
  },
  {
    "icon": Icons.emergency_share_outlined,
    "text": "Emergency Responder",
    "iconBg": const Color(0xFFE74C3C), // Red background for emergency
  },
];
