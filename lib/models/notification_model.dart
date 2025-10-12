import 'package:flutter/material.dart';

enum NotificationType {
  medical,
  blockchain,
  appointment,
  emergency,
  system,
}

enum NotificationPriority {
  low,
  medium,
  high,
  urgent,
}
class NotificationItem {
  final String id;
  final String title;
  final String message;
  final NotificationType type;
  final DateTime timestamp;
  bool isRead;
  final NotificationPriority priority;
  final bool actionRequired;
  final String? blockchainTxHash;
  final IconData? icon;
  final List<List<dynamic>>? hugeIcon;
  final Color color;

  NotificationItem({
    required this.id,
    required this.title,
    required this.message,
    required this.type,
    required this.timestamp,
    required this.isRead,
    required this.priority,
    required this.actionRequired,
    this.blockchainTxHash,
     this.icon,
     this.hugeIcon,
    required this.color,
  });
}