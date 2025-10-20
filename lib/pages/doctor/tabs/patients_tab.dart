import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';

class PatientsTab extends StatefulWidget {
  const PatientsTab({super.key});

  @override
  State<PatientsTab> createState() => _PatientsTabState();
}

class _PatientsTabState extends State<PatientsTab> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.transparent
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header with back button
              Container(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      "Patients",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              // Tab Bar
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white.withOpacity(0.6),
                  labelStyle: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  unselectedLabelStyle: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  tabs: const [
                    Tab(text: "Upcoming"),
                    Tab(text: "Past"),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Tab Content
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildUpcomingTab(),
                    _buildPastTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUpcomingTab() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        children: [
          _buildPatientCard(
            name: "Liam Harper",
            time: "10:00 AM, In-person",
            buttonText: "Join",
            buttonColor: const Color(0xFF1E293B),
            onButtonTap: () {
              Get.snackbar(
                "Joining Session",
                "Starting in-person consultation with Liam Harper",
                backgroundColor: Colors.green,
                colorText: Colors.white,
              );
            },
          ),
          const SizedBox(height: 16),
          _buildPatientCard(
            name: "Olivia Bennerett",
            time: "10:00 AM, Virtual",
            buttonText: "Details",
            buttonColor: Colors.white.withOpacity(0.3),
            textColor: Colors.white,
            onButtonTap: () {
              Get.snackbar(
                "Patient Details",
                "Viewing Olivia Bennerett's consultation details",
                backgroundColor: const Color(0xFF010A38),
                colorText: Colors.white,
              );
            },
          ),
          const SizedBox(height: 16),
          _buildPatientCard(
            name: "Ava Morgan",
            time: "10:00 AM, Virtual",
            buttonText: "Details",
            buttonColor: Colors.white.withOpacity(0.3),
            textColor: Colors.white,
            onButtonTap: () {
              Get.snackbar(
                "Patient Details",
                "Viewing Ava Morgan's consultation details",
                backgroundColor: const Color(0xFF010A38),
                colorText: Colors.white,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPastTab() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        children: [
          _buildPatientCard(
            name: "Noah Carter",
            time: "Yesterday, 2:00 PM",
            buttonText: "Details",
            buttonColor: Colors.white.withOpacity(0.3),
            textColor: Colors.white,
            onButtonTap: () {
              Get.snackbar(
                "Past Consultation",
                "Viewing Noah Carter's past consultation details",
                backgroundColor: const Color(0xFF010A38),
                colorText: Colors.white,
              );
            },
          ),
          const SizedBox(height: 16),
          _buildPatientCard(
            name: "Emma Wilson",
            time: "2 days ago, 11:00 AM",
            buttonText: "Details",
            buttonColor: Colors.white.withOpacity(0.3),
            textColor: Colors.white,
            onButtonTap: () {
              Get.snackbar(
                "Past Consultation",
                "Viewing Emma Wilson's past consultation details",
                backgroundColor: const Color(0xFF010A38),
                colorText: Colors.white,
              );
            },
          ),
          const SizedBox(height: 16),
          _buildPatientCard(
            name: "James Rodriguez",
            time: "Last week, 3:30 PM",
            buttonText: "Details",
            buttonColor: Colors.white.withOpacity(0.3),
            textColor: Colors.white,
            onButtonTap: () {
              Get.snackbar(
                "Past Consultation",
                "Viewing James Rodriguez's past consultation details",
                backgroundColor: const Color(0xFF010A38),
                colorText: Colors.white,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPatientCard({
    required String name,
    required String time,
    required String buttonText,
    required Color buttonColor,
    Color? textColor,
    required VoidCallback onButtonTap,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: Colors.white.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          // Profile Image
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
                width: 2,
              ),
            ),
            child: const CircleAvatar(
              backgroundImage: AssetImage("assets/backgrounds/background.png"),
            ),
          ),
          const SizedBox(width: 16),
          
          // Patient Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: GoogleFonts.poppins(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          
          // Action Button
          GestureDetector(
            onTap: onButtonTap,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text(
                buttonText,
                style: GoogleFonts.poppins(
                  color: textColor ?? Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}