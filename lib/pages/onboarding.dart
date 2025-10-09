import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_app/routes/app_routes.dart';
import 'package:hackathon_app/ui/btn.dart';
import 'package:hackathon_app/ui/deep_blue_gradient_background.dart';
import '../constants/utils.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
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
                children: [
                  // Image Section - Takes available space but with constraints
                  Expanded(
                    flex: 3,
                    child: Container(
                      width: double.infinity,
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: Utils.onboarding.length,
                        itemBuilder: (context, index) {
                          final item = Utils.onboarding[index];
                          return Center(
                            child: Image.asset(
                              item["image"],
                              width: screenWidth * 0.8,
                              fit: BoxFit.contain,
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  // Content Section - Fixed height to prevent overflow
                  Container(
                    height: screenHeight * 0.35,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Page indicators (only show on non-last pages)
                        if (!isLastPage) ...[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: List.generate(
                              Utils.onboarding.length,
                              (index) => _buildPageIndicator(index),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],

                        // Title
                        Text(
                          Utils.onboarding[_currentPage]["title"],
                          style: GoogleFonts.poppins(
                            fontSize: isLastPage ? 26 : 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            height: 1.2,
                          ),
                        ),

                        const SizedBox(height: 12),

                        // Description - Expanded to take available space
                        Expanded(
                          child: Text(
                            Utils.onboarding[_currentPage]["desc"],
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Colors.white.withOpacity(0.9),
                              fontWeight: FontWeight.w400,
                              height: 1.4,
                            ),
                          ),
                        ),

                        // Buttons Section - Fixed at bottom
                        Padding(
                          padding: const EdgeInsets.only(top: 16, bottom: 16),
                          child: isLastPage
                              ? Row(
                                  children: [
                                    Expanded(
                                      child: Btn(
                                        onClick: () {
                                          Get.offAllNamed(AppPages.auth);
                                        },
                                        fontSize: 16,
                                        backgroundless: true,
                                        label: "Sign up",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Btn(
                                        fontSize: 16,
                                        onClick: () =>
                                            Get.offAllNamed(AppPages.login),
                                        label: "Log in",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                )
                              : Btn(
                                  onClick: () {
                                    _pageController.nextPage(
                                      duration: const Duration(
                                        milliseconds: 400,
                                      ),
                                      curve: Curves.easeOut,
                                    );
                                  },
                                  label: "Next",
                                  fontWeight: FontWeight.w500,
                                ),
                        ),
                      ],
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
