import 'package:flutter/material.dart';

class Doctor {
  final String name;
  final String department;
  final String specialization;
  final String experience;
  final double rating;
  final String consultationFee;
  final bool isVerified;
  final bool isOnline;
  final String image;
  final String nextAvailable;
  final String blockchainId;

  Doctor({
    required this.name,
    required this.department,
    required this.specialization,
    required this.experience,
    required this.rating,
    required this.consultationFee,
    required this.isVerified,
    required this.isOnline,
    required this.image,
    required this.nextAvailable,
    required this.blockchainId,
  });
}

class DepartmentInfo {
  final String name;
  final IconData? icon;
  final List<List<dynamic>>? hugeIcon;
  final String? iconString;
  final int doctorCount;
  final String description;
  final Color color;
  final bool isEmergency;

  DepartmentInfo({
    required this.name,
    this.icon,
    this.hugeIcon,
    this.iconString,
    required this.doctorCount,
    required this.description,
    required this.color,
    required this.isEmergency,
  });
}
