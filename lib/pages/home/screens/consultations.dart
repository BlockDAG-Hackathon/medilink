import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_app/models/consultation.dart';
import 'package:hackathon_app/pages/home/screens/consultation/consultation_form.dart';
import '../../../ui/btn.dart';

// Dummy Data matching the screenshot
final List<Consultation> consultations = [
  Consultation(
    name: 'Dr. Ben Carter',
    hospital: 'General Hospital',
    description: 'Follow-up on your recent blood test results.',
    timeStatus: '10:30 AM',
    status: 'Completed',
    statusColor: const Color(0xFF4CAF50), // Green
    imagePath: 'assets/ben_carter.jpg',
  ),
  Consultation(
    name: 'Dr. Evelyn Reed',
    hospital: 'City Clinic',
    description: 'Regarding your prescription renewal.',
    timeStatus: 'Yesterday',
    status: 'Awaiting Reply',
    statusColor: const Color(0xFF2196F3), // Blue
    imagePath: 'assets/evelyn_reed.jpg',
  ),
  Consultation(
    name: 'Dr. Chloe Bennett',
    hospital: 'General Hospital',
    description: 'Initial consultation about your flu symptoms.',
    timeStatus: '2 days ago',
    status: 'Completed',
    statusColor: const Color(0xFF4CAF50), // Green
    imagePath: 'assets/chloe_bennett.jpg',
  ),
  Consultation(
    name: 'Dr. Marcus Thorne',
    hospital: 'Wellness Center',
    description: 'Your scheduled video call confirmation.',
    timeStatus: 'March 15, 2024',
    status: 'Pending',
    statusColor: const Color(0xFFFF9800), // Orange
    imagePath: 'assets/marcus_thorne.jpg',
  ),
];

class ConsultationTab extends StatelessWidget {
  const ConsultationTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Consultations',
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.grey),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          top: 8.0,
          bottom:
              90.0, // Extra padding to account for bottom sheet (70) + FAB space
        ),
        itemCount: consultations.length,
        itemBuilder: (context, index) {
          return ConsultationCard(consultation: consultations[index]);
        },
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 70.0),
        child: FloatingActionButton.extended(
          onPressed: () {
            Get.dialog(ConsultationFormDialog());
          },
          backgroundColor: const Color(0xFF010A38),
          foregroundColor: Colors.white,
          icon: const Icon(Icons.add),
          label: Text(
            "Book Consultation",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // Bottom navigation bar is omitted as requested
    );
  }
}

class ConsultationCard extends StatelessWidget {
  final Consultation consultation;

  const ConsultationCard({required this.consultation, super.key});

  // Helper widget for the colored status dot and text badge
  Widget _buildStatus(String status, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
      decoration: BoxDecoration(
        color: color.withOpacity(0.5),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.circle, color: color, size: 8),
          const SizedBox(width: 6),
          Text(
            status,
            style: GoogleFonts.poppins(
              color: color,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.all(10.0),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: CircleAvatar(
                radius: 28,
                backgroundColor: Colors.grey[200],
                child: Icon(Icons.person, color: Colors.grey[600]),
                // In a real app, use: backgroundImage: AssetImage(consultation.imagePath),
              ),
            ),

            // 2. Details (Expanded to fill remaining width)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row for Name/Hospital and Time/Date
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Doctor Name and Hospital (Left text column)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            consultation.name,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            consultation.hospital,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),

                      // Time/Date Status (Right text)
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 2.0,
                        ), // Align with name's baseline
                        child: Text(
                          consultation.timeStatus,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[500],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // Consultation Description
                  Text(
                    consultation.description,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.black54,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Status Badge
                  _buildStatus(consultation.status, consultation.statusColor),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
