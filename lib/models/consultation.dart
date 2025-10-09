import 'package:flutter/material.dart';

class Consultation {
  final String name;
  final String hospital;
  final String description;
  final String timeStatus;
  final String status;
  final Color statusColor;
  final String imagePath; // Used for the image asset path

  Consultation({
    required this.name,
    required this.hospital,
    required this.description,
    required this.timeStatus,
    required this.status,
    required this.statusColor,
    required this.imagePath,
  });
}