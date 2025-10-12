import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_app/routes/app_routes.dart';
import 'package:hackathon_app/ui/btn.dart';
import 'package:hackathon_app/ui/deep_blue_gradient_background.dart';
import 'package:hugeicons/hugeicons.dart';
import '../constants/utils.dart';

class WhoAreYouScreen extends StatefulWidget {
  const WhoAreYouScreen({super.key});

  @override
  State<WhoAreYouScreen> createState() => _WhoAreYouScreenState();
}

class _WhoAreYouScreenState extends State<WhoAreYouScreen> {
  // Controller for the PageView to swipe between screens
  final PageController _pageController = PageController();
  // State to track the current page index
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    // Listen for page changes to update the indicator dots
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // --- Widget for the Page Indicator Dot ---
  Widget _buildPageIndicator(int index) {
    bool isActive = index == _currentPage;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      height: 6.0,
      width: 24.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.white54,
        borderRadius: BorderRadius.circular(3.0),
      ),
    );
  }

  // --- Main Build Method ---
  @override
  Widget build(BuildContext context) {
    // Get screen dimensions and safe area
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // Determine if we are on the last page to show the Get Started button
    final isLastPage = _currentPage == Utils.onboarding.length - 1;

    return Scaffold(
      body: Stack(
        children: [
          DeepBlueGradientBackground(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "What best describes you ?",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  Text(
                    "This will help us tailor your experience",
                    style: GoogleFonts.poppins(
                      color: Color.from(
                        alpha: 0.498,
                        red: 1,
                        green: 1,
                        blue: 1,
                      ),
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 20),
                  ...options.map((item) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 7,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: BoxBorder.all(
                          color: Color(item["borderColor"]),
                        ),
                        
                      ),
                    );
                  }).toList(),
                  Btn(
                    onClick: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeOut,
                      );
                    },
                    label: "Next",
                    fontWeight: FontWeight.w500,
                  ),

                  SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final List<dynamic> options = [
  {
    "icon": HugeIcons.strokeRoundedDoctor01,
    "text": "Doctor",
    "borderColor": 0xFFFFFFFF,
  },
  {
    "icon": HugeIcons.strokeRoundedPatient,
    "text": "Patient",
    "borderColor": 0xFFFFFFFF,
  },
  {
    "icon": Icons.emergency_share_outlined,
    "text": "Emergency Reporter",
    "borderColor": 0xFFFFFFFF,
  },
];
