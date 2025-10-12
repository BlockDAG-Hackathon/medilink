import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_app/controllers/signup_controller.dart';

enum DropdownType { gender, bloodGroup }

class CustomDropdown extends StatelessWidget {
  final SignupController controller;
  final String labelText;
  final DropdownType type;

  const CustomDropdown({
    super.key,
    required this.controller,
    required this.labelText,
    this.type = DropdownType.gender,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            labelText,
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          height: 60, // Fixed height to match Input widget's visual size
          decoration: BoxDecoration(
            color: Colors.grey.shade300, // Grey background color to match inputs
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Obx(() => DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              value: _getCurrentValue(),
              icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey.shade600),
              dropdownColor: Colors.grey.shade300, // Dropdown menu background
              style: GoogleFonts.poppins(
                color: Colors.grey.shade800,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  _updateValue(newValue);
                }
              },
              items: _getItems().map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: GoogleFonts.poppins(
                      color: value == 'Select' 
                          ? Colors.grey.shade600 
                          : Colors.grey.shade800,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                );
              }).toList(),
            ),
          )),
        ),
      ],
    );
  }

  String _getCurrentValue() {
    switch (type) {
      case DropdownType.gender:
        return controller.selectedGender.value;
      case DropdownType.bloodGroup:
        return controller.selectedBloodGroup.value;
    }
  }

  void _updateValue(String newValue) {
    switch (type) {
      case DropdownType.gender:
        controller.selectedGender.value = newValue;
        break;
      case DropdownType.bloodGroup:
        controller.selectedBloodGroup.value = newValue;
        break;
    }
  }

  List<String> _getItems() {
    switch (type) {
      case DropdownType.gender:
        return controller.genders;
      case DropdownType.bloodGroup:
        return controller.bloodGroups;
    }
  }
}

