import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../../models/consultation.dart';

// Doctor-specific consultation data
final List<Consultation> doctorConsultations = [
  Consultation(
    name: 'Liam Harper',
    hospital: 'Cardiology Department',
    description: 'Follow-up consultation for cardiac evaluation results.',
    timeStatus: '10:30 AM Today',
    status: 'Scheduled',
    statusColor: const Color(0xFF2196F3), // Blue
    imagePath: 'assets/backgrounds/background.png',
  ),
  Consultation(
    name: 'Olivia Bennett',
    hospital: 'Virtual Consultation',
    description: 'Review of recent test results and treatment plan.',
    timeStatus: '2:00 PM Today',
    status: 'In Progress',
    statusColor: const Color(0xFF4CAF50), // Green
    imagePath: 'assets/backgrounds/background.png',
  ),
  Consultation(
    name: 'Ava Morgan',
    hospital: 'Cardiology Department',
    description: 'Initial consultation for chest pain evaluation.',
    timeStatus: 'Yesterday',
    status: 'Completed',
    statusColor: const Color(0xFF4CAF50), // Green
    imagePath: 'assets/backgrounds/background.png',
  ),
  Consultation(
    name: 'Noah Carter',
    hospital: 'Emergency Consultation',
    description: 'Urgent cardiac assessment and monitoring.',
    timeStatus: '2 days ago',
    status: 'Completed',
    statusColor: const Color(0xFF4CAF50), // Green
    imagePath: 'assets/backgrounds/background.png',
  ),
  Consultation(
    name: 'Emma Wilson',
    hospital: 'Virtual Consultation',
    description: 'Post-surgery follow-up and recovery assessment.',
    timeStatus: 'March 15, 2024',
    status: 'Pending Review',
    statusColor: const Color(0xFFFF9800), // Orange
    imagePath: 'assets/backgrounds/background.png',
  ),
];

class DoctorConsultationsTab extends StatelessWidget {
  const DoctorConsultationsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          // gradient: LinearGradient(
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          //   colors: [
          //     Color(0xFF1E3A8A), // Deep blue
          //     Color(0xFF3B82F6), // Lighter blue
          //   ],
          // ),
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
                    Expanded(
                      child: Text(
                        "Consultations",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.snackbar(
                          "Search",
                          "Opening consultation search",
                          backgroundColor: const Color(0xFF010A38),
                          colorText: Colors.white,
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const HugeIcon(
                          icon: HugeIcons.strokeRoundedSearch01,
                          size: 20,
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Consultations List
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListView.builder(
                    itemCount: doctorConsultations.length,
                    itemBuilder: (context, index) {
                      return DoctorConsultationCard(
                        consultation: doctorConsultations[index],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 20, right: 10),
        child: FloatingActionButton.extended(
          onPressed: () {
            Get.snackbar(
              "New Consultation",
              "Opening consultation scheduler",
              backgroundColor: const Color(0xFF010A38),
              colorText: Colors.white,
            );
          },
          backgroundColor: const Color(0xFF010A38),
          foregroundColor: Colors.white,
          icon: const HugeIcon(
            icon: HugeIcons.strokeRoundedAdd01,
            size: 20,
            color: Colors.white,
            strokeWidth: 2,
          ),
          label: Text(
            "Schedule",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class DoctorConsultationCard extends StatelessWidget {
  final Consultation consultation;

  const DoctorConsultationCard({required this.consultation, super.key});

  Widget _buildStatus(String status, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.5)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            status,
            style: GoogleFonts.poppins(
              color: color,
              fontWeight: FontWeight.w600,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withOpacity(0.2),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Patient Avatar
          Container(
            width: 50,
            height: 50,
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

          // Consultation Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Patient Name and Time
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        consultation.name,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Text(
                      consultation.timeStatus,
                      style: GoogleFonts.poppins(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),

                // Department/Type
                Text(
                  consultation.hospital,
                  style: GoogleFonts.poppins(
                    color: Colors.white.withOpacity(0.6),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 8),

                // Description
                Text(
                  consultation.description,
                  style: GoogleFonts.poppins(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),

                // Status and Action Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildStatus(consultation.status, consultation.statusColor),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (consultation.status == 'Scheduled' || consultation.status == 'In Progress')
                          GestureDetector(
                            onTap: () {
                              Get.snackbar(
                                "Join Consultation",
                                "Starting consultation with ${consultation.name}",
                                backgroundColor: Colors.green,
                                colorText: Colors.white,
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.green.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: Colors.green.withOpacity(0.5),
                                ),
                              ),
                              child: Text(
                                "Join",
                                style: GoogleFonts.poppins(
                                  color: Colors.green,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {
                            Get.snackbar(
                              "Patient Details",
                              "Viewing ${consultation.name}'s consultation details",
                              backgroundColor: const Color(0xFF010A38),
                              colorText: Colors.white,
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.3),
                              ),
                            ),
                            child: Text(
                              "Details",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}