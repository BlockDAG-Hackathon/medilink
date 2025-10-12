import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:hackathon_app/ui/input.dart';
import 'package:hackathon_app/ui/textarea.dart';

class BodypartConditionDescription extends StatelessWidget {
  const BodypartConditionDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: Get.height * 0.5,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            decoration: BoxDecoration(color: Colors.white),
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
                      "provide detailed information about your medical condition this part of your body",
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: const Text('Cancel'),
                      onPressed: () => Get.back(),
                    ),
                    TextButton(
                      child: const Text('Save'),
                      onPressed: () {
                        // Update state via the GetX controller
                        // hController.saveIntensity(partId, selectedIntensity.value);
                        // hController.saveDescription(partId, descController.text);
                        Get.back();
                      },
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
