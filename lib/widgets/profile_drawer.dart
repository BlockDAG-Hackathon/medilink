import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';

class ProfileDrawer extends StatelessWidget {
  const ProfileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,

        actions: [
          GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              margin: EdgeInsets.only(top: Get.height * 0.1, right: 20),
            
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const HugeIcon(
                icon: HugeIcons.strokeRoundedCancel01,
                size: 20,
                color: Colors.white,
                strokeWidth: 2,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
        ),
        child: Column(
          children: [
            // Header
            Container(
              padding: EdgeInsets.only(
                top: Get.height * 0.06,
                bottom: 20,
                left: 20,
                right: 20,
              ),

              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [const Color(0xFF010A38), const Color(0xFF1A2B5C)],
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 3),
                        ),
                        child: const CircleAvatar(
                          backgroundImage: AssetImage(
                            "assets/backgrounds/background.png",
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Yusuf Ahmed",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.green.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: Colors.green,
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 6,
                                    height: 6,
                                    decoration: const BoxDecoration(
                                      color: Colors.green,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    "Verified Patient",
                                    style: GoogleFonts.poppins(
                                      color: Colors.green,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
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

            // Menu Items
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(24),
                children: [
                  _buildMenuItem(
                    icon: HugeIcons.strokeRoundedUser,
                    title: "Personal Information",
                    subtitle: "Manage your profile details",
                    onTap: () {
                      Get.back();
                      // Navigate to personal info
                    },
                  ),
                  _buildMenuItem(
                    icon: HugeIcons.strokeRoundedMedicalFile,
                    title: "Medical Records",
                    subtitle: "View your encrypted health data",
                    onTap: () {
                      Get.back();
                      // Navigate to medical records
                    },
                  ),
                  _buildMenuItem(
                    icon: HugeIcons.strokeRoundedWallet03,
                    title: "Crypto Wallet",
                    subtitle: "Manage payments & transactions",
                    onTap: () {
                      Get.back();
                      // Navigate to wallet
                    },
                  ),
                  _buildMenuItem(
                    icon: HugeIcons.strokeRoundedUserGroup,
                    title: "Emergency Contacts",
                    subtitle: "Manage trusted contacts",
                    onTap: () {
                      Get.back();
                      // Navigate to emergency contacts
                    },
                  ),
                  _buildMenuItem(
                    icon: HugeIcons.strokeRoundedBlockchain01,
                    title: "Blockchain Security",
                    subtitle: "View security & privacy settings",
                    onTap: () {
                      Get.back();
                      // Navigate to blockchain settings
                    },
                  ),
                  _buildMenuItem(
                    icon: HugeIcons.strokeRoundedDoctor01,
                    title: "My Doctors",
                    subtitle: "Manage healthcare providers",
                    onTap: () {
                      Get.back();
                      // Navigate to doctors
                    },
                  ),
                  _buildMenuItem(
                    icon: HugeIcons.strokeRoundedCalendar03,
                    title: "Appointments",
                    subtitle: "View & schedule appointments",
                    onTap: () {
                      Get.back();
                      // Navigate to appointments
                    },
                  ),
                  _buildMenuItem(
                    icon: HugeIcons.strokeRoundedSettings02,
                    title: "Settings",
                    subtitle: "App preferences & configuration",
                    onTap: () {
                      Get.back();
                      // Navigate to settings
                    },
                  ),

                  const SizedBox(height: 20),

                  // Blockchain Status Card
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF010A38).withOpacity(0.05),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFF010A38).withOpacity(0.1),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const HugeIcon(
                              icon: HugeIcons.strokeRoundedBlockchain01,
                              size: 20,
                              color: Color(0xFF010A38),
                              strokeWidth: 2,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "Blockchain Status",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF010A38),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "Secure & Encrypted",
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Logout Button
                  GestureDetector(
                    onTap: () {
                      Get.back();
                      _showLogoutDialog();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.red.withOpacity(0.2)),
                      ),
                      child: Row(
                        children: [
                          const HugeIcon(
                            icon: HugeIcons.strokeRoundedLogout01,
                            size: 20,
                            color: Colors.red,
                            strokeWidth: 2,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            "Logout",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required List<List<dynamic>> icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[200]!),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFF010A38).withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: HugeIcon(
                icon: icon,
                size: 20,
                color: const Color(0xFF010A38),
                strokeWidth: 2,
              ),
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
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            const HugeIcon(
              icon: HugeIcons.strokeRoundedArrowRight01,
              size: 16,
              color: Colors.grey,
              strokeWidth: 2,
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog() {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(
          "Logout",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: const Color(0xFF010A38),
          ),
        ),
        content: Text(
          "Are you sure you want to logout? Your data will remain securely encrypted on the blockchain.",
          style: GoogleFonts.poppins(color: Colors.grey[600]),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text(
              "Cancel",
              style: GoogleFonts.poppins(color: Colors.grey[600]),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Get.back();
              // Implement logout logic
              Get.snackbar(
                "Logged Out",
                "You have been securely logged out",
                backgroundColor: Colors.red,
                colorText: Colors.white,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              "Logout",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
