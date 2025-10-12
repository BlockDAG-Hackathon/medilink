import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_app/constants/utils.dart';
import 'package:hackathon_app/models/inbox_model.dart';
import 'package:hugeicons/hugeicons.dart';

class Inbox extends StatefulWidget {
  const Inbox({super.key});

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> with TickerProviderStateMixin {
  late TabController _tabController;
  String selectedFilter = 'All';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Inbox',
          style: GoogleFonts.poppins(
            color: const Color(0xFF010A38),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => _showSearchModal(),
            icon: const HugeIcon(
              icon: HugeIcons.strokeRoundedSearch01,
              size: 24,
              color: Color(0xFF010A38),
              strokeWidth: 2,
            ),
          ),
          IconButton(
            onPressed: () => _composeMessage(),
            icon: const HugeIcon(
              icon: HugeIcons.strokeRoundedEdit02,
              size: 24,
              color: Color(0xFF010A38),
              strokeWidth: 2,
            ),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: const Color(0xFF010A38),
          unselectedLabelColor: Colors.grey,
          indicatorColor: const Color(0xFF010A38),
          labelStyle: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          tabs: const [
            Tab(text: 'Primary'),
            Tab(text: 'Updates'),
            Tab(text: 'Archive'),
          ],
        ),
      ),
      body: Column(
        children: [
          // Blockchain Status & Stats
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [const Color(0xFF010A38), const Color(0xFF1A2B5C)],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.green.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const HugeIcon(
                    icon: HugeIcons.strokeRoundedMessage01,
                    size: 20,
                    color: Colors.green,
                    strokeWidth: 2,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Secure Messaging',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'All messages are blockchain-encrypted',
                        style: GoogleFonts.poppins(
                          color: Colors.white.withValues(alpha: 0.8),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${_getUnreadCount()}',
                        style: GoogleFonts.poppins(
                          color: Colors.red,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'unread',
                        style: GoogleFonts.poppins(
                          color: Colors.red,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Tab Content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildPrimaryTab(),
                _buildUpdatesTab(),
                _buildArchiveTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrimaryTab() {
    final primaryMessages = Utils.messages
        .where(
          (m) =>
              m.messageType == MessageType.doctor ||
              m.messageType == MessageType.appointment ||
              m.messageType == MessageType.labResults,
        )
        .toList();

    final filteredMessages = selectedFilter == 'All'
        ? primaryMessages
        : primaryMessages
              .where((m) => _getFilterType(m.messageType) == selectedFilter)
              .toList();

    return Column(
      children: [
        // Filter Chips
        Container(
          height: 50,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: Utils.inbox_filters.length,
            itemBuilder: (context, index) {
              final filter = Utils.inbox_filters[index];
              final isSelected = selectedFilter == filter;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedFilter = filter;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 12),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xFF010A38) : Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: isSelected
                          ? const Color(0xFF010A38)
                          : Colors.grey[300]!,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      filter,
                      style: GoogleFonts.poppins(
                        color: isSelected ? Colors.white : Colors.grey[600],
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 16),

        // Messages List
        Expanded(
          child: filteredMessages.isEmpty
              ? _buildEmptyState()
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: filteredMessages.length,
                  itemBuilder: (context, index) {
                    final message = filteredMessages[index];
                    return _buildMessageCard(message);
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildUpdatesTab() {
    final updateMessages = Utils.messages
        .where(
          (m) =>
              m.messageType == MessageType.system ||
              m.messageType == MessageType.insurance ||
              m.messageType == MessageType.prescription,
        )
        .toList();

    return updateMessages.isEmpty
        ? _buildEmptyState()
        : ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: updateMessages.length,
            itemBuilder: (context, index) {
              final message = updateMessages[index];
              return _buildMessageCard(message);
            },
          );
  }

  Widget _buildArchiveTab() {
    final archivedMessages = Utils.messages
        .where((m) => DateTime.now().difference(m.timestamp).inDays >= 7)
        .toList();

    return archivedMessages.isEmpty
        ? _buildEmptyArchiveState()
        : ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: archivedMessages.length,
            itemBuilder: (context, index) {
              final message = archivedMessages[index];
              return _buildMessageCard(message, isArchived: true);
            },
          );
  }

  Widget _buildMessageCard(Message message, {bool isArchived = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: message.isRead
              ? Colors.grey[200]!
              : _getMessageTypeColor(
                  message.messageType,
                ).withValues(alpha: 0.3),
          width: message.isRead ? 1 : 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => _showMessageDetails(message),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    // Sender Avatar
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 24,
                          backgroundImage: NetworkImage(message.senderImage),
                        ),
                        if (message.blockchainVerified)
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1,
                                ),
                              ),
                              child: const HugeIcon(
                                icon: HugeIcons.strokeRoundedBlockchain01,
                                size: 8,
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            ),
                          ),
                      ],
                    ),

                    const SizedBox(width: 12),

                    // Message Info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  message.senderName,
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: message.isRead
                                        ? FontWeight.w500
                                        : FontWeight.w600,
                                    color: const Color(0xFF010A38),
                                  ),
                                ),
                              ),
                              if (message.priority == MessagePriority.high)
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.red.withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    'HIGH',
                                    style: GoogleFonts.poppins(
                                      fontSize: 8,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                            ],
                          ),

                          const SizedBox(height: 2),

                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: _getMessageTypeColor(
                                    message.messageType,
                                  ).withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  message.senderRole,
                                  style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: _getMessageTypeColor(
                                      message.messageType,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                _formatTimestamp(message.timestamp),
                                style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  color: Colors.grey[500],
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Read Status & Attachments
                    Column(
                      children: [
                        if (!message.isRead)
                          Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: _getMessageTypeColor(message.messageType),
                              shape: BoxShape.circle,
                            ),
                          ),
                        if (message.hasAttachment)
                          const Padding(
                            padding: EdgeInsets.only(top: 4),
                            child: HugeIcon(
                              icon: HugeIcons.strokeRoundedAttachment02,
                              size: 12,
                              color: Colors.grey,
                              strokeWidth: 2,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // Subject
                Text(
                  message.subject,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: message.isRead
                        ? FontWeight.w500
                        : FontWeight.w600,
                    color: const Color(0xFF010A38),
                  ),
                ),

                const SizedBox(height: 4),

                // Preview
                Text(
                  message.preview,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                  ),
                ),

                // Blockchain Verification
                if (message.blockchainVerified) ...[
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF010A38).withValues(alpha: 0.05),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const HugeIcon(
                          icon: HugeIcons.strokeRoundedShield01,
                          size: 12,
                          color: Color(0xFF010A38),
                          strokeWidth: 2,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'Blockchain Verified',
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: const Color(0xFF010A38),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              shape: BoxShape.circle,
            ),
            child: HugeIcon(
              icon: HugeIcons.strokeRoundedMailOpen01,
              size: 48,
              color: Colors.grey[400]!,
              strokeWidth: 2,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'No messages found',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Your secure blockchain messages will appear here',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.grey[500],
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyArchiveState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              shape: BoxShape.circle,
            ),
            child: HugeIcon(
              icon: HugeIcons.strokeRoundedArchive,
              size: 48,
              color: Colors.grey[400]!,
              strokeWidth: 2,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'No archived messages',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Messages older than 7 days will appear here',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.grey[500],
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Color _getMessageTypeColor(MessageType type) {
    switch (type) {
      case MessageType.doctor:
        return Colors.blue;
      case MessageType.insurance:
        return Colors.green;
      case MessageType.labResults:
        return Colors.purple;
      case MessageType.appointment:
        return Colors.orange;
      case MessageType.prescription:
        return Colors.teal;
      case MessageType.system:
        return const Color(0xFF010A38);
    }
  }

  String _getFilterType(MessageType type) {
    switch (type) {
      case MessageType.doctor:
        return 'Doctors';
      case MessageType.insurance:
        return 'Insurance';
      case MessageType.labResults:
        return 'Lab Results';
      case MessageType.appointment:
        return 'Appointments';
      case MessageType.prescription:
        return 'Prescriptions';
      case MessageType.system:
        return 'System';
    }
  }

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      return '${timestamp.day}/${timestamp.month}/${timestamp.year}';
    }
  }

  int _getUnreadCount() {
    return Utils.messages.where((m) => !m.isRead).length;
  }

  void _showSearchModal() {
    Get.bottomSheet(
      Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search messages...',
                prefixIcon: const HugeIcon(
                  icon: HugeIcons.strokeRoundedSearch01,
                  size: 20,
                  color: Colors.grey,
                  strokeWidth: 2,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _composeMessage() {
    Get.snackbar(
      'Compose Message',
      'Opening secure message composer...',
      backgroundColor: const Color(0xFF010A38),
      colorText: Colors.white,
    );
  }

  void _showMessageDetails(Message message) {
    setState(() {
      message.isRead = true;
    });

    Get.bottomSheet(
      Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle bar
            Container(
              margin: const EdgeInsets.only(top: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            // Header
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(message.senderImage),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              message.senderName,
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF010A38),
                              ),
                            ),
                            Text(
                              message.senderRole,
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (message.blockchainVerified)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const HugeIcon(
                                icon: HugeIcons.strokeRoundedShield01,
                                size: 12,
                                color: Colors.green,
                                strokeWidth: 2,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Verified',
                                style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  Text(
                    message.subject,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF010A38),
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    _formatTimestamp(message.timestamp),
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),

            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message.content,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.grey[700],
                        height: 1.5,
                      ),
                    ),

                    if (message.hasAttachment) ...[
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.grey[50],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Attachments',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF010A38),
                              ),
                            ),
                            const SizedBox(height: 8),
                            ...message.attachments.map((attachment) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: Row(
                                  children: [
                                    const HugeIcon(
                                      icon: HugeIcons.strokeRoundedAttachment02,
                                      size: 16,
                                      color: Colors.grey,
                                      strokeWidth: 2,
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        attachment,
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          color: const Color(0xFF010A38),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ],
                        ),
                      ),
                    ],

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),

            // Actions
            Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Get.back(),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: BorderSide(color: Colors.grey[300]!),
                      ),
                      child: Text(
                        'Close',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                        _replyToMessage(message);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF010A38),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Reply',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }

  void _replyToMessage(Message message) {
    Get.snackbar(
      'Reply',
      'Opening secure reply to ${message.senderName}...',
      backgroundColor: const Color(0xFF010A38),
      colorText: Colors.white,
    );
  }
}
