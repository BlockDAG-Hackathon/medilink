import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(top: 25, left: 25),
          child: GestureDetector(
            onTap: () {},
            child: HugeIcon(icon: HugeIcons.strokeRoundedUser02, size: 20),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 25, right: 25),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 5,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: HugeIcon(
                    icon: HugeIcons.strokeRoundedHelpCircle,
                    size: 20,
                    color: Color(0xFF010A38),
                  ),
                ),

                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.qr_code_scanner_outlined,
                    size: 20,
                    color: Color(0xFF010A38),
                  ),
                ),

                GestureDetector(
                  onTap: () {},
                  child: HugeIcon(
                    icon: HugeIcons.strokeRoundedNotification01,
                    size: 20,
                    color: Color(0xFF010A38),
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
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Action(
                    text: "My Records",
                    onClick: () {},
                    hugeIcon: HugeIcons.strokeRoundedFolder03,
                  ),
                  Action(
                    text: "Wallet",
                    onClick: () {},
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
          ],
        ),
      ),
    );
  }
}

class Action extends StatelessWidget {
  final String text;
  final IconData? materialIcon;
  final List<List<dynamic>>? hugeIcon;
  final VoidCallback onClick;

  Action({
    super.key,
    required this.text,
    this.materialIcon,
    this.hugeIcon,
    required this.onClick,
  }) : assert(
         materialIcon != null || hugeIcon != null,
         'Either materialIcon or hugeIcon must be provided',
       );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: Get.width * 0.2,
            height: Get.width * 0.2,
            child: CircleAvatar(
              backgroundColor: const Color(0x33030D43),
              radius: Get.width * 0.1,
              child: materialIcon != null
                  ? Icon(materialIcon, color: const Color(0xFF030D43), size: 24)
                  : HugeIcon(
                      icon: hugeIcon!,
                      color: const Color(0xFF030D43),
                      size: 24,
                    ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            text,
            style: GoogleFonts.poppins(
              color: const Color(0xFF010A38),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
