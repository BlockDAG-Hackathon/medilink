import 'package:flutter/material.dart' hide Action;
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../../ui/action_btn.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      appBar: AppBar(
        leadingWidth: Get.width * 0.3,
        leading: Padding(
          padding: EdgeInsets.only(top: 25, left: 25, bottom: 10),

          child: GestureDetector(
            onTap: () {},
            child: Row(
              spacing: 10,
              children: [
                // profie image
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
                  onTap: () {},
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
                        Colors.black.withOpacity(0.7),
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
