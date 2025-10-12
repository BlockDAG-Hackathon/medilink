import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_app/constants/utils.dart';
import 'package:hackathon_app/models/notification_model.dart';
import 'package:hugeicons/hugeicons.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications>
    with TickerProviderStateMixin {
  late TabController _tabController;
  String selectedFilter = 'All';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
          'Notifications',
          style: GoogleFonts.poppins(
            color: const Color(0xFF010A38),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => _markAllAsRead(),
            icon: const HugeIcon(
              icon: HugeIcons.strokeRoundedCheckmarkCircle01,
              size: 24,
              color: Color(0xFF010A38),
              strokeWidth: 2,
            ),
          ),
          IconButton(
            onPressed: () => _showNotificationSettings(),
            icon: const HugeIcon(
              icon: HugeIcons.strokeRoundedSettings02,
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
            Tab(text: 'Recent'),
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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.green.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const HugeIcon(
                              icon: HugeIcons.strokeRoundedNotification01,
                              size: 16,
                              color: Colors.green,
                              strokeWidth: 2,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Notification Center',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Real-time blockchain & medical updates',
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
              children: [_buildRecentTab(), _buildArchiveTab()],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentTab() {
    final recentNotifications =Utils. notifications
        .where((n) => DateTime.now().difference(n.timestamp).inDays < 7)
        .toList();

    final filteredNotifications = selectedFilter == 'All'
        ? recentNotifications
        : recentNotifications
              .where((n) => _getFilterType(n.type) == selectedFilter)
              .toList();

    return Column(
      children: [
        // Filter Chips
        Container(
          height: 50,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:Utils. filters.length,
            itemBuilder: (context, index) {
              final filter =Utils. filters[index];
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

        // Notifications List
        Expanded(
          child: filteredNotifications.isEmpty
              ? _buildEmptyState()
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: filteredNotifications.length,
                  itemBuilder: (context, index) {
                    final notification = filteredNotifications[index];
                    return _buildNotificationCard(notification);
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildArchiveTab() {
    final archivedNotifications =Utils. notifications
        .where((n) => DateTime.now().difference(n.timestamp).inDays >= 7)
        .toList();

    return archivedNotifications.isEmpty
        ? _buildEmptyArchiveState()
        : ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: archivedNotifications.length,
            itemBuilder: (context, index) {
              final notification = archivedNotifications[index];
              return _buildNotificationCard(notification, isArchived: true);
            },
          );
  }

  Widget _buildNotificationCard(
    NotificationItem notification, {
    bool isArchived = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: notification.isRead
              ? Colors.grey[200]!
              : notification.color.withValues(alpha: 0.3),
          width: notification.isRead ? 1 : 2,
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
          onTap: () => _showNotificationDetails(notification),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    // Priority & Type Indicator
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: notification.color.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: notification.hugeIcon != null
                          ? HugeIcon(
                              icon: notification.hugeIcon!,
                              size: 20,
                              color: notification.color,
                              strokeWidth: 2,
                            )
                          : Icon(
                              notification.icon,
                              size: 20,
                              color: notification.color,
                            ),
                    ),

                    const SizedBox(width: 12),

                    // Title & Priority
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  notification.title,
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: notification.isRead
                                        ? FontWeight.w500
                                        : FontWeight.w600,
                                    color: const Color(0xFF010A38),
                                  ),
                                ),
                              ),
                              if (notification.priority ==
                                  NotificationPriority.urgent)
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
                                    'URGENT',
                                    style: GoogleFonts.poppins(
                                      fontSize: 8,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                            ],
                          ),

                          const SizedBox(height: 4),

                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: notification.color.withValues(
                                    alpha: 0.1,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  _getFilterType( notification.type),
                                  style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: notification.color,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                _formatTimestamp(notification.timestamp),
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

                    // Read Status
                    if (!notification.isRead)
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: notification.color,
                          shape: BoxShape.circle,
                        ),
                      ),
                  ],
                ),

                const SizedBox(height: 12),

                // Message
                Text(
                  notification.message,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                  ),
                ),

                // Blockchain Transaction Hash
                if (notification.blockchainTxHash != null) ...[
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF010A38).withValues(alpha: 0.05),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      children: [
                        const HugeIcon(
                          icon: HugeIcons.strokeRoundedBlockchain01,
                          size: 12,
                          color: Color(0xFF010A38),
                          strokeWidth: 2,
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            'TX: ${notification.blockchainTxHash!.substring(0, 20)}...',
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              color: const Color(0xFF010A38),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () =>
                              _copyToClipboard(notification.blockchainTxHash!),
                          child: const HugeIcon(
                            icon: HugeIcons.strokeRoundedCopy01,
                            size: 12,
                            color: Color(0xFF010A38),
                            strokeWidth: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],

                // Action Required
                if (notification.actionRequired) ...[
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () =>
                              _dismissNotification(notification.id),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            side: BorderSide(color: Colors.grey[300]!),
                          ),
                          child: Text(
                            'Dismiss',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () =>
                              _handleNotificationAction(notification),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: notification.color,
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          child: Text(
                            'Take Action',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
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
              icon: HugeIcons.strokeRoundedNotificationOff01,
              size: 48,
              color: Colors.grey[400]!,
              strokeWidth: 2,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'No notifications found',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'You\'re all caught up with your blockchain health updates',
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
            'No archived notifications',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Older notifications will appear here after 7 days',
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

  String _getFilterType(NotificationType type) {
    switch (type) {
      case NotificationType.medical:
        return 'Medical';
      case NotificationType.blockchain:
        return 'Blockchain';
      case NotificationType.appointment:
        return 'Appointments';
      case NotificationType.emergency:
        return 'Emergency';
      case NotificationType.system:
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
    return Utils.notifications.where((n) => !n.isRead).length;
  }

  void _markAllAsRead() {
    setState(() {
      for (var notification in Utils.notifications) {
        notification.isRead = true;
      }
    });

    Get.snackbar(
      'Notifications',
      'All notifications marked as read',
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  void _showNotificationSettings() {
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
            Text(
              'Notification Settings',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF010A38),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Notification preferences coming soon',
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[600]),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _showNotificationDetails(NotificationItem notification) {
    setState(() {
      notification.isRead = true;
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
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
              margin: const EdgeInsets.only(bottom: 20),
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: notification.color.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: notification.hugeIcon != null
                      ? HugeIcon(
                          icon: notification.hugeIcon!,
                          size: 24,
                          color: notification.color,
                          strokeWidth: 2,
                        )
                      : Icon(
                          notification.icon,
                          size: 24,
                          color: notification.color,
                        ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        notification.title,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF010A38),
                        ),
                      ),
                      Text(
                        _formatTimestamp(notification.timestamp),
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              notification.message,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.grey[700],
                height: 1.5,
              ),
            ),
            if (notification.blockchainTxHash != null) ...[
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF010A38).withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Blockchain Transaction',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF010A38),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      notification.blockchainTxHash!,
                      style: GoogleFonts.poppins(
                        fontSize: 10,
                        color: const Color(0xFF010A38),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            const SizedBox(height: 20),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }

  void _dismissNotification(String id) {
    setState(() {
      Utils.notifications.removeWhere((n) => n.id == id);
    });

    Get.snackbar(
      'Notification',
      'Notification dismissed',
      backgroundColor: Colors.grey,
      colorText: Colors.white,
    );
  }

  void _handleNotificationAction(NotificationItem notification) {
    switch (notification.type) {
      case NotificationType.appointment:
        Get.snackbar(
          'Appointment',
          'Opening appointment details...',
          backgroundColor: Colors.blue,
          colorText: Colors.white,
        );
        break;
      case NotificationType.medical:
        Get.snackbar(
          'Medical Record',
          'Opening medical records...',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        break;
      case NotificationType.blockchain:
        Get.snackbar(
          'Blockchain',
          'Opening blockchain explorer...',
          backgroundColor: const Color(0xFF010A38),
          colorText: Colors.white,
        );
        break;
      default:
        Get.snackbar(
          'Action',
          'Processing notification action...',
          backgroundColor: notification.color,
          colorText: Colors.white,
        );
    }
  }

  void _copyToClipboard(String text) {
    // Implement clipboard copy functionality
    Get.snackbar(
      'Copied',
      'Transaction hash copied to clipboard',
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }
}

