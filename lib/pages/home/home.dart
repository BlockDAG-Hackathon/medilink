import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_app/controllers/home_controller.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({super.key});

  @override
  final HomeController controller = Get.put(HomeController());

  Widget _buildIcon(dynamic iconData, Color color, double size) {
    if (iconData is IconData) {
      // Handle Material Icons
      return Icon(iconData, color: color, size: size);
    } else if (iconData is List<List<dynamic>>) {
      // Handle HugeIcons
      return HugeIcon(icon: iconData, color: color, size: size);
    } else {
      // Fallback for unknown types
      return Icon(Icons.error, color: color, size: size);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),

      body: Obx(
        () => controller.widgetOptions.elementAt(controller.selectedIndex),
      ),

      bottomNavigationBar: Obx(
        () => CurvedNavigationBar(
          index: controller.selectedIndex,
          height: 65,
          backgroundColor: const Color(0xFFEEEEEE),
          color: Colors.white, // White navigation bar background
          buttonBackgroundColor: const Color(
            0xFF010A38,
          ), // Dark button background
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 300),
          onTap: (index) => controller.onItemTapped(index),
          items: controller.navItems.map((item) {
            final isSelected =
                controller.selectedIndex == controller.navItems.indexOf(item);
            return _buildIcon(
              isSelected ? item['activeIcon'] : item['icon'],
              isSelected ? Colors.white : const Color(0xFF010A38),
              28,
            );
          }).toList(),
        ),
      ),
    );
  }
}
