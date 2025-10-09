import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HeatmapController extends GetxController {
  // RxMap to hold the body part ID (String) and its reported intensity (int)
  final bodyPartIntensities = <String, int>{
    'chest': 5,
    'back': 4,
    'arm': 10,
    'leg': 5,
    'butt': 10,
    'shoulder': 0,
    'neck': 2,
    'abs': 8,
  }.obs;

  // RxMap to hold descriptive text for the tapped part
  final partDescriptions = <String, String>{}.obs;

  void saveIntensity(String partId, int intensity) {
    bodyPartIntensities[partId] = intensity;
    bodyPartIntensities.refresh(); // Ensure all Obx listeners update
  }

  void saveDescription(String partId, String description) {
    if (description.trim().isNotEmpty) {
      partDescriptions[partId] = description.trim();
    } else {
      partDescriptions.remove(partId);
    }
    partDescriptions.refresh();
  }
}