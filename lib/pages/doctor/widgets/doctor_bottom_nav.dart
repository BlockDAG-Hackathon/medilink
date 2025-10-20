import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_app/controllers/doc_home_controller.dart';
import 'package:hugeicons/hugeicons.dart';
import '../tabs/patients_tab.dart';

class DoctorBottomNav extends StatelessWidget {
  
  final controller = Get.put(DocHomeController());
   DoctorBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: const BoxDecoration(color: Color(0xFF030D43)),
      child: Obx(() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(HugeIcons.strokeRoundedHome01, "Home", 0),
          _buildNavItem(HugeIcons.strokeRoundedUserGroup, "Patients", 1),
          _buildNavItem(
            HugeIcons.strokeRoundedMedicalFile,
            "Consults",
            2,
          ),
          _buildNavItem(HugeIcons.strokeRoundedMessage01, "Messages", 3),
          _buildNavItem(HugeIcons.strokeRoundedSettings02, "Settings", 4),
        ],
      )),
    );
  }

  Widget _buildNavItem(List<List<dynamic>> icon, String label, int index) {
    final isActive = controller.selectedIndex.value == index;
    
    return GestureDetector(
      onTap: () {
        if (index <= 2) {
          // Navigate to Home, Patients, or Consults
          controller.selectedIndex.value = index;
        } else if (label == "Messages") {
          Get.snackbar(
            "Messages",
            "Opening messages page",
            backgroundColor: const Color(0xFF010A38),
            colorText: Colors.white,
          );
        } else if (label == "Settings") {
          Get.snackbar(
            "Settings",
            "Opening settings page",
            backgroundColor: const Color(0xFF010A38),
            colorText: Colors.white,
          );
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isActive ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: HugeIcon(
              icon: icon,
              size: 20,
              color: isActive
                  ? const Color(0xFF1E3A8A)
                  : Colors.white.withValues(alpha: 0.6),
              strokeWidth: 2,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.poppins(
              color: isActive ? Colors.white : Colors.white.withValues(alpha: 0.6),
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}