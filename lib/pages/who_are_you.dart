import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_app/ui/deep_blue_gradient_background.dart';
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
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          const DeepBlueGradientBackground(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Image.asset("assets/ui/who.png", width: Get.width * 0.9),
                  SizedBox(height: screenHeight * 0.045),

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
                      color: Colors.white.withOpacity(0.7),
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: screenHeight * 0.07),

                  // Options
                  ...List.generate(options.length, (index) {
                    final option = options[index];
                    final isSelected = selectedOption == index;

                    return Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 16),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedOption = index;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 18,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Colors.white.withOpacity(0.1)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: isSelected
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.3),
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
                                        option["icon"].runtimeType == IconData
                                        ? Icon(
                                            option["icon"],
                                            color: Colors.white,
                                            // size: 15,
                                          )
                                        : HugeIcon(
                                            icon: option["icon"] as List<List<dynamic>>,
                                            color: Colors.white,
                                            // size: 15,
                                          ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Text(
                                option["text"],
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),

                  const Spacer(),

                  // Continue Button
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 20),
                    child: ElevatedButton(
                      onPressed: selectedOption != null
                          ? () {
                              // Handle continue action
                              Get.toNamed('/signup');
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        disabledBackgroundColor: Colors.white.withOpacity(0.3),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        "Continue",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: selectedOption != null
                              ? const Color(0xFF041679)
                              : Colors.grey[600],
                        ),
                      ),
                    ),
                  ),
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
