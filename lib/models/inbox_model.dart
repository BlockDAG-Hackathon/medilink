// Enums and Models
enum MessageType {
  doctor,
  insurance,
  labResults,
  appointment,
  prescription,
  system,
}

enum MessagePriority {
  low,
  medium,
  high,
}

class Message {
  final String id;
  final String senderName;
  final String senderRole;
  final String subject;
  final String preview;
  final String content;
  final DateTime timestamp;
  bool isRead;
  final MessageType messageType;
  final MessagePriority priority;
  final bool hasAttachment;
  final bool blockchainVerified;
  final String senderImage;
  final List<String> attachments;

  Message({
    required this.id,
    required this.senderName,
    required this.senderRole,
    required this.subject,
    required this.preview,
    required this.content,
    required this.timestamp,
    required this.isRead,
    required this.messageType,
    required this.priority,
    required this.hasAttachment,
    required this.blockchainVerified,
    required this.senderImage,
    required this.attachments,
  });
}