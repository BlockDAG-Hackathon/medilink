import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import '../constants/utils.dart';

class Btn extends StatelessWidget {
  final VoidCallback? onClick;
  final String label; // Made final
  final bool backgroundless;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? textColor;
  final IconData? icon;
  final Color? bgColor; // CHANGED TYPE from int? to Color?

  Btn({
    super.key,
    required this.onClick,
    required this.label,
    required this.fontWeight,
    this.backgroundless = false,
    this.fontSize,
    this.textColor,
    this.icon,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    // FIX: Simplified color assignment. If bgColor is null, it defaults to white.
    // The bitwise operation is removed because bgColor is now already a Color.
    final Color finalBgColor = backgroundless
        ? Colors.transparent
        : bgColor ??
              const Color(
                0xFFFFFFFF,
              ); // Use white as default if bgColor is null

    // Determine the text/icon color based on provided property or button style
    final Color finalTextColor =
        textColor ??
        (backgroundless ? const Color(0xFFFFFFFF) : const Color(0xFF041679));

    return GestureDetector(
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        width: Utils.width,
        decoration: BoxDecoration(
          color: finalBgColor,
          borderRadius: BorderRadius.circular(10),
          border: backgroundless
              ? Border.all(
                  width: 1,
                  style: BorderStyle.solid,
                  // Use the determined text color for the border
                  color: finalTextColor,
                )
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 10,
          children: [
            if (icon != null)
              Icon(
                icon,
                size: 20,
                color: finalTextColor, // Icon color
              ),
            Text(
              label,
              style: TextStyle(
                color: finalTextColor, // Text color
                fontWeight: fontWeight,
                fontSize: fontSize ?? 24,
                fontFamily: GoogleFonts.poppins.toString(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
