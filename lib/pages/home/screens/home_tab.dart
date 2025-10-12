import 'package:flutter/material.dart' hide Action;
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../../ui/action_btn.dart';
import '../../../widgets/profile_drawer.dart';
import '../../../widgets/health_wallet.dart';
import "../screens/notifications.dart";

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  void _showEmergencyModal() {
    Get.bottomSheet(
      Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle bar
            Container(
              margin: const EdgeInsets.only(top: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            // Header
            Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.red.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const HugeIcon(
                      icon: HugeIcons.strokeRoundedAlert02,
                      size: 32,
                      color: Colors.red,
                      strokeWidth: 2,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Emergency Assistance",
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF010A38),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Blockchain-secured emergency response system",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),

            // Emergency Options
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  _buildEmergencyOption(
                    hugeIcon: HugeIcons.strokeRoundedCall,
                    title: "Call Emergency Services",
                    subtitle: "Instantly connect to local emergency services",
                    color: Colors.red,
                    onTap: () {
                      Get.back();
                      _handleEmergencyCall();
                    },
                  ),
                  const SizedBox(height: 12),
                  _buildEmergencyOption(
                    hugeIcon: HugeIcons.strokeRoundedLocation01,
                    title: "Share Location",
                    subtitle:
                        "Broadcast encrypted location to emergency contacts",
                    color: Colors.orange,
                    onTap: () {
                      Get.back();
                      _handleLocationShare();
                    },
                  ),
                  const SizedBox(height: 12),
                  _buildEmergencyOption(
                    hugeIcon: HugeIcons.strokeRoundedMedicalFile,
                    title: "Medical Alert",
                    subtitle: "Share critical medical info via blockchain",
                    color: const Color(0xFF010A38),
                    onTap: () {
                      Get.back();
                      _handleMedicalAlert();
                    },
                  ),
                  const SizedBox(height: 12),
                  _buildEmergencyOption(
                    hugeIcon: HugeIcons.strokeRoundedUserGroup,
                    title: "Contact Emergency Contacts",
                    subtitle: "Notify your trusted contacts immediately",
                    color: Colors.blue,
                    onTap: () {
                      Get.back();
                      _handleContactEmergencyContacts();
                    },
                  ),
                ],
              ),
            ),

            // Blockchain Security Notice
            Container(
              margin: const EdgeInsets.all(24),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF010A38).withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xFF010A38).withValues(alpha: 0.1),
                ),
              ),
              child: Row(
                children: [
                  const HugeIcon(
                    icon: HugeIcons.strokeRoundedBlockchain01,
                    size: 20,
                    color: Color(0xFF010A38),
                    strokeWidth: 2,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      "All emergency data is encrypted and stored securely on the blockchain",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: const Color(0xFF010A38),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Cancel Button
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => Get.back(),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    side: BorderSide(color: Colors.grey[300]!),
                  ),
                  child: Text(
                    "Cancel",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ),
            ),

            // Safe area padding
            SizedBox(height: MediaQuery.of(Get.context!).padding.bottom),
          ],
        ),
      ),
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
    );
  }

  Widget _buildEmergencyOption({
    IconData? icon,
    List<List<dynamic>>? hugeIcon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[200]!),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: hugeIcon != null
                  ? HugeIcon(
                      icon: hugeIcon,
                      size: 24,
                      color: color,
                      strokeWidth: 2,
                    )
                  : Icon(icon, size: 24, color: color, weight: 2),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF010A38),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const HugeIcon(
              icon: HugeIcons.strokeRoundedArrowRight01,
              size: 20,
              color: Colors.grey,
              strokeWidth: 2,
            ),
          ],
        ),
      ),
    );
  }

  void _handleEmergencyCall() {
    // Show confirmation dialog for emergency call
    Get.dialog(
      AlertDialog(
        title: Text(
          "Emergency Call",
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        content: Text(
          "This will immediately call emergency services. Your location and medical information will be shared securely via blockchain.",
          style: GoogleFonts.poppins(),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text("Cancel", style: GoogleFonts.poppins()),
          ),
          ElevatedButton(
            onPressed: () {
              Get.back();
              // Implement actual emergency call logic
              Get.snackbar(
                "Emergency Call",
                "Connecting to emergency services...",
                backgroundColor: Colors.red,
                colorText: Colors.white,
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: Text(
              "Call Now",
              style: GoogleFonts.poppins(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void _handleLocationShare() {
    Get.snackbar(
      "Location Shared",
      "Your encrypted location has been shared with emergency contacts",
      backgroundColor: Colors.orange,
      colorText: Colors.white,
    );
  }

  void _handleMedicalAlert() {
    Get.snackbar(
      "Medical Alert Sent",
      "Critical medical information shared via blockchain",
      backgroundColor: const Color(0xFF010A38),
      colorText: Colors.white,
    );
  }

  void _handleContactEmergencyContacts() {
    Get.snackbar(
      "Contacts Notified",
      "Emergency contacts have been notified of your situation",
      backgroundColor: Colors.blue,
      colorText: Colors.white,
    );
  }

  void _showProfileDrawer() {
    Get.to(
      () => const ProfileDrawer(),
      transition: Transition.leftToRight,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      appBar: AppBar(
        leadingWidth: Get.width * 0.3,
        leading: Padding(
          padding: EdgeInsets.only(top: 25, left: 25, bottom: 10),
          child: GestureDetector(
            onTap: () => _showProfileDrawer(),
            child: Row(
              spacing: 10,
              children: [
                // profile image
                SizedBox(
                  width: Get.width * 0.07,
                  height: Get.width * 0.07,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                      "assets/backgrounds/background.png",
                    ),
                  ),
                ),
                Text(
                  "Yusuf",
                  style: GoogleFonts.poppins(
                    color: Color(0xFF010A38),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 25, right: 25, bottom: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 5,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: HugeIcon(
                    icon: HugeIcons.strokeRoundedHelpCircle,
                    size: 25,
                    color: Color(0xFF010A38),
                    strokeWidth: 2,
                  ),
                ),

                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.qr_code_scanner_outlined,
                    size: 25,
                    color: Color(0xFF010A38),
                    weight: 2,
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    Get.dialog(Notifications());
                  },
                  child: HugeIcon(
                    icon: HugeIcons.strokeRoundedNotification01,
                    size: 25,
                    color: Color(0xFF010A38),
                    strokeWidth: 2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10, top: 20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Action(
                    text: "My Records",
                    onClick: () {},
                    hugeIcon: HugeIcons.strokeRoundedFolder03,
                  ),
                  Action(
                    text: "Wallet",
                    onClick: () {
                      Get.to(
                        () => const HealthWallet(),
                        transition: Transition.rightToLeft,
                        duration: const Duration(milliseconds: 300),
                      );
                    },
                    hugeIcon: HugeIcons.strokeRoundedWallet03,
                  ),
                  Action(
                    text: "Doctors",
                    onClick: () {},
                    hugeIcon: HugeIcons.strokeRoundedDoctor01,
                  ),
                ],
              ),
            ),

            // Emergency Section
            Container(
              margin: EdgeInsets.only(bottom: 20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF010A38), Color(0xFF1A2B5C)],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF010A38).withValues(alpha: 0.3),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.red.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: HugeIcon(
                                icon: HugeIcons.strokeRoundedAlert02,
                                size: 20,
                                color: Colors.red,
                                strokeWidth: 2,
                              ),
                            ),
                            SizedBox(width: 12),
                            Text(
                              "Emergency",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Secure blockchain-verified emergency assistance",
                          style: GoogleFonts.poppins(
                            color: Colors.white.withValues(alpha: 0.8),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _showEmergencyModal(),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.red.withValues(alpha: 0.4),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          HugeIcon(
                            icon: HugeIcons.strokeRoundedCall,
                            size: 16,
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                          SizedBox(width: 6),
                          Text(
                            "SOS",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Upcoming appointments",
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Add new +",
                    style: GoogleFonts.poppins(
                      color: Colors.blueAccent.shade400,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              // height: Get.height * 0.15,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Babanla Hospital",
                        textAlign: TextAlign.right,
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.35,
                        child: Text(
                          "July 05, 2024 10:00AM",
                          softWrap: true,
                          textAlign: TextAlign.end,
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Radiology",
                        style: GoogleFonts.poppins(
                          color: Colors.blueAccent.shade200,

                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "10 min",
                        softWrap: true,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.blueAccent.shade200,

                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    spacing: 10,
                    children: [
                      GestureDetector(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            border: Border.all(
                              color: Colors.blueAccent.shade200,
                              width: 1,
                              style: BorderStyle.solid,
                            ),
                          ),
                          child: Text(
                            "Cancel",
                            style: GoogleFonts.poppins(
                              color: Colors.blueAccent.shade200,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            border: Border.all(
                              color: Colors.blueAccent.shade200,
                              width: 1,
                              style: BorderStyle.solid,
                            ),
                          ),
                          child: Text(
                            "Reschedule",
                            style: GoogleFonts.poppins(
                              color: Colors.blueAccent.shade200,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Stack(
              children: [
                Container(
                  height: Get.height * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://images.unsplash.com/photo-1659353888477-6e6aab941b55?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: Get.height * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withValues(alpha: 0.7),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  right: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "REMINDER",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Have yourself checked",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "Your medical records are between you and you alone!",
                        softWrap: true,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
