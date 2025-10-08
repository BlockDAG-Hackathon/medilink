import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart'; 
class Input extends StatelessWidget {
  final String hintText;
  final bool isPassword;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final Function(String)? onChanged;
  final IconData? suffixIcon;

  late final RxBool _obscureText;

  Input({
    super.key,
    required this.hintText,
    this.isPassword = false,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.suffixIcon,
  }) {
    // Initialize the RxBool based on the initial 'isPassword' value.
    _obscureText = isPassword.obs;
  }

  // Toggles the visibility state for password fields
  void _toggleObscureText() {
    _obscureText.value = !_obscureText.value;
  }

  @override
  Widget build(BuildContext context) {
    // The Obx widget rebuilds only the parts that use the reactive state (_obscureText.value).
    return Obx(() {
      // Determine the primary suffix icon and its action
      Widget? suffixWidget;

      if (isPassword) {
        // If it's a password field, use the eye icon for toggling
        suffixWidget = GestureDetector(
          onTap: _toggleObscureText,
          child: Icon(
            // Check the reactive state value
            _obscureText.value ? Icons.visibility_off_outlined : Icons.visibility_outlined,
            color: Colors.white54,
            size: 24,
          ),
        );
      } else if (suffixIcon != null) {
        // If a non-password icon is explicitly provided
        suffixWidget = Icon(
          suffixIcon,
          color: Colors.white54,
          size: 24,
        );
      }

      return Container(
        decoration: BoxDecoration(
          color: const Color(0xFF2B2B2B), // Dark background color
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        child: TextField(
          controller: controller,
          keyboardType: keyboardType,
          onChanged: onChanged,
          obscureText: _obscureText.value,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.white54,
              fontSize: 18,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
            border: InputBorder.none, // Remove default underline border
            suffixIcon: suffixWidget != null
                ? Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: suffixWidget,
                  )
                : null,
            suffixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
            contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
          ),
        ),
      );
    });
  }
}
