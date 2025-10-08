import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_app/controllers/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({super.key});

  @override
  final HomeController controller = Get.put(HomeController());

  Widget _buildCustomNavBarItem(
    int index,
    String label,
    IconData icon,
    IconData activeIcon,
  ) {
    return Obx(() {
      final bool isSelected = index == controller.selectedIndex;
      const Color activeColor = Color(0xFF030D43);
      final Color itemColor = isSelected
          ? activeColor
          : Colors.white.withValues(alpha: 0.6);

      return Expanded(
        child: GestureDetector(
          onTap: () => controller.onItemTapped(index),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 4,
                  children: [
                    // Space for the icon (elevated or normal)
                    SizedBox(
                      height: isSelected
                          ? 70
                          : 50, // Extra space for elevated icon
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Elevated active icon that extends beyond parent
                          if (isSelected)
                            Positioned(
                              top: -20, // Elevate above the container
                              child: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  border: Border.all(
                                    color: activeColor,
                                    width: 3,
                                  ),
                                  borderRadius: BorderRadius.circular(Get.width*0.2)
                                  
                                ),
                                child: Icon(
                                  activeIcon,
                                  color: activeColor,
                                  size: 30,
                                ),
                              ),
                            )
                          else
                            // Normal inactive icon
                            Icon(icon, color: itemColor, size: 26),
                        ],
                      ),
                    ),
                    Text(
                      label,
                      style: GoogleFonts.poppins(
                        color: itemColor,
                        fontSize: 12,
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get the bottom padding (safe area) to correctly position the custom sheet
    final double bottomPadding = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      // Use a dark background consistent with previous files
      backgroundColor: const Color(0xFFEEEEEE),

      body: Obx(
        () => controller.widgetOptions.elementAt(controller.selectedIndex),
      ),

      bottomSheet: Container(
        color: const Color(0xFF010A38),

        padding: EdgeInsets.only(
          top: 10,
          bottom: bottomPadding > 0 ? bottomPadding : 10,
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: controller.navItems.asMap().entries.map((entry) {
            final index = entry.key;
            final item = entry.value;
            return _buildCustomNavBarItem(
              index,
              item['label'] as String,
              item['icon'] as IconData,
              item['activeIcon'] as IconData,
            );
          }).toList(),
        ),
      ),
    );
  }
}
