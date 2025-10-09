import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';

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
            width: Get.width * 0.165,
            height: Get.width * 0.165,
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
