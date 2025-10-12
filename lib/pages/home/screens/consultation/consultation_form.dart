import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_app/pages/home/screens/consultation/body_chart_heatmap.dart';
import 'package:hackathon_app/ui/btn.dart';
import 'package:hackathon_app/ui/dropdown_bottom_sheet_dialog.dart';
import 'package:hackathon_app/ui/input.dart';
import 'package:hackathon_app/ui/textarea.dart';
import 'package:hugeicons/hugeicons.dart';

class ConsultationFormDialog extends StatelessWidget {
  const ConsultationFormDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(top: 25, left: 25),
          child: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black),
          ),
        ),

        title: Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Text(
            "New consultation",
            style: GoogleFonts.poppins(
              color: const Color(0xFF030D43),
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Consultation Title",
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF030D43),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Input(
                hintText: "Briefly describe your concern",
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Description",
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF030D43),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              MicrophoneTextArea(
                hintText:
                    "provide detailed information about your medical condition or how you are feelin currently",
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Healthcare provider",
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF030D43),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              DropdownBottomSheetDialog(
                title: " Healthcare provider",
                onChanged: (value) {},
                options: ["Hello"],
                selectedValue: "",
                placeholder: "Select a healthcare provider",
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Specific description",
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF030D43),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Btn(
                onClick: () {
                  Get.dialog(BodyChartHeatmap());
                },
                label: "Click",
                textColor: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                bgColor: Colors.blue.shade400,
                hugeIcon: HugeIcons.strokeRoundedBackMuscleBody,
              ),
              SizedBox(height: 20),
              Btn(
                onClick: () {},
                label: "Submit Consultation",
                textColor: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                bgColor: const Color(0xFF010A38),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
