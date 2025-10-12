import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';

class Me extends StatefulWidget {
  const Me({super.key});

  @override
  State<Me> createState() => _MeState();
}

class _MeState extends State<Me> {
  final UserProfile userProfile = UserProfile(
    name: 'Yusuf Ahmed',
    email: 'yusuf.ahmed@healthchain.com',
    phone: '+234 801 234 5678',
    dateOfBirth: DateTime(1990, 5, 15),
    bloodType: 'O+',
    allergies: ['Penicillin', 'Shellfish'],
    emergencyContact: 'Sarah Ahmed - +234 802 345 6789',
    walletAddress: '0x742d35Cc6634C0532925a3b8D4C0532925a3b8D4',
    walletBalance: 0.245,
    memberSince: DateTime(2023, 1, 15),
    verificationLevel: VerificationLevel.verified,
    profileImage:
        'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400',
    medicalRecordHash:
        '0x8f3e2a1b9c7d6e5f4a3b2c1d0e9f8a7b6c5d4e3f2a1b0c9d8e7f6a5b4c3d2e1f',
    insuranceProvider: 'HealthChain Insurance',
    policyNumber: 'HC-2023-789456',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: CustomScrollView(
        slivers: [
          // Custom App Bar with Profile Header
          SliverAppBar(
            expandedHeight: 320,
            floating: false,
            pinned: true,
            backgroundColor: const Color(0xFF010A38),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [const Color(0xFF010A38), const Color(0xFF1A2B5C)],
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        // Header Actions
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'My Profile',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () => _showQRCode(),
                                  icon: const HugeIcon(
                                    icon: HugeIcons.strokeRoundedQrCode01,
                                    size: 24,
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () => _showSettings(),
                                  icon: const HugeIcon(
                                    icon: HugeIcons.strokeRoundedSettings02,
                                    size: 24,
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // Profile Info
                        Row(
                          children: [
                            // Profile Image with Verification Badge
                            Stack(
                              children: [
                                CircleAvatar(
                                  radius: 40,
                                  backgroundImage: NetworkImage(
                                    userProfile.profileImage,
                                  ),
                                ),
                                if (userProfile.verificationLevel ==
                                    VerificationLevel.verified)
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 2,
                                        ),
                                      ),
                                      child: const HugeIcon(
                                        icon: HugeIcons
                                            .strokeRoundedCheckmarkCircle01,
                                        size: 16,
                                        color: Colors.white,
                                        strokeWidth: 2,
                                      ),
                                    ),
                                  ),
                              ],
                            ),

                            const SizedBox(width: 16),

                            // User Info
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    userProfile.name,
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),

                                  const SizedBox(height: 4),

                                  Row(
                                    children: [
                                      const HugeIcon(
                                        icon:
                                            HugeIcons.strokeRoundedBlockchain01,
                                        size: 14,
                                        color: Colors.green,
                                        strokeWidth: 2,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        'Blockchain Verified',
                                        style: GoogleFonts.poppins(
                                          color: Colors.green,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 8),

                                  Text(
                                    'Member since ${_formatDate(userProfile.memberSince)}',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white.withValues(
                                        alpha: 0.8,
                                      ),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // Wallet Info
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.2),
                            ),
                          ),
                          child: Row(
                            children: [
                              const HugeIcon(
                                icon: HugeIcons.strokeRoundedWallet03,
                                size: 20,
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${userProfile.walletBalance.toStringAsFixed(3)} ETH',
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      '${userProfile.walletAddress.substring(0, 10)}...${userProfile.walletAddress.substring(userProfile.walletAddress.length - 8)}',
                                      style: GoogleFonts.poppins(
                                        color: Colors.white.withValues(
                                          alpha: 0.8,
                                        ),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () => _copyWalletAddress(),
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: 0.2),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const HugeIcon(
                                    icon: HugeIcons.strokeRoundedCopy01,
                                    size: 16,
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Profile Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Quick Stats
                  _buildQuickStats(),

                  const SizedBox(height: 20),

                  // Medical Information
                  _buildMedicalInfo(),

                  const SizedBox(height: 20),

                  // Blockchain & Security
                  _buildBlockchainSection(),

                  const SizedBox(height: 20),

                  // Account Management
                  _buildAccountSection(),

                  const SizedBox(height: 20),

                  // Support & Legal
                  _buildSupportSection(),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickStats() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Health Overview',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF010A38),
            ),
          ),

          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  hugeIcon: HugeIcons.strokeRoundedMedicalFile,
                  title: 'Records',
                  value: '24',
                  color: Colors.blue,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  hugeIcon: HugeIcons.strokeRoundedCalendar03,
                  title: 'Appointments',
                  value: '8',
                  color: Colors.green,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  hugeIcon: HugeIcons.strokeRoundedMedicine01,
                  title: 'Prescriptions',
                  value: '3',
                  color: Colors.purple,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard({
    IconData? icon,
    List<List<dynamic>>? hugeIcon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          icon != null
              ? Icon(icon, size: 24, color: color)
              : HugeIcon(
                  icon: hugeIcon!,
                  size: 24,
                  color: color,
                  strokeWidth: 2,
                ),
          const SizedBox(height: 8),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMedicalInfo() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const HugeIcon(
                icon: HugeIcons.strokeRoundedMedicalFile,
                size: 20,
                color: Color(0xFF010A38),
                strokeWidth: 2,
              ),
              const SizedBox(width: 8),
              Text(
                'Medical Information',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF010A38),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          _buildInfoRow(
            'Blood Type',
            userProfile.bloodType,
            null,
            HugeIcons.strokeRoundedRainDoubleDrop,
          ),
          _buildInfoRow(
            'Date of Birth',
            _formatDate(userProfile.dateOfBirth),
            null,
            HugeIcons.strokeRoundedCalendar03,
          ),
          _buildInfoRow(
            'Emergency Contact',
            userProfile.emergencyContact,
            null,
            HugeIcons.strokeRoundedCall,
          ),
          _buildInfoRow(
            'Insurance',
            '${userProfile.insuranceProvider} - ${userProfile.policyNumber}',
            null,
            HugeIcons.strokeRoundedShield01,
          ),

          const SizedBox(height: 12),

          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.red.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const HugeIcon(
                      icon: HugeIcons.strokeRoundedAlert02,
                      size: 16,
                      color: Colors.red,
                      strokeWidth: 2,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Allergies',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: userProfile.allergies.map((allergy) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        allergy,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.red,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBlockchainSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const HugeIcon(
                icon: HugeIcons.strokeRoundedBlockchain01,
                size: 20,
                color: Color(0xFF010A38),
                strokeWidth: 2,
              ),
              const SizedBox(width: 8),
              Text(
                'Blockchain & Security',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF010A38),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          _buildMenuTile(
            hugeIcon: HugeIcons.strokeRoundedWallet03,
            title: 'Wallet Management',
            subtitle: 'Manage your crypto wallet and transactions',
            onTap: () => _openWalletManagement(),
          ),

          _buildMenuTile(
            hugeIcon: HugeIcons.strokeRoundedShield01,
            title: 'Medical Record Hash',
            subtitle: 'View blockchain verification of your records',
            onTap: () => _showMedicalRecordHash(),
          ),

          _buildMenuTile(
            hugeIcon: HugeIcons.strokeRoundedContracts,
            title: 'Smart Contracts',
            subtitle: 'View active insurance and medical contracts',
            onTap: () => _showSmartContracts(),
          ),

          _buildMenuTile(
            hugeIcon: HugeIcons.strokeRoundedKey01,
            title: 'Private Keys',
            subtitle: 'Manage your encryption keys securely',
            onTap: () => _showPrivateKeys(),
          ),
        ],
      ),
    );
  }

  Widget _buildAccountSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const HugeIcon(
                icon: HugeIcons.strokeRoundedUser,
                size: 20,
                color: Color(0xFF010A38),
                strokeWidth: 2,
              ),
              const SizedBox(width: 8),
              Text(
                'Account Management',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF010A38),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          _buildMenuTile(
            hugeIcon: HugeIcons.strokeRoundedEdit02,
            title: 'Edit Profile',
            subtitle: 'Update your personal information',
            onTap: () => _editProfile(),
          ),

          _buildMenuTile(
            hugeIcon: HugeIcons.strokeRoundedNotification01,
            title: 'Notification Settings',
            subtitle: 'Manage your notification preferences',
            onTap: () => _showNotificationSettings(),
          ),

          _buildMenuTile(
            hugeIcon: HugeIcons.strokeRoundedLock,
            title: 'Privacy & Security',
            subtitle: 'Control your data privacy settings',
            onTap: () => _showPrivacySettings(),
          ),

          _buildMenuTile(
            hugeIcon: HugeIcons.strokeRoundedDownload01,
            title: 'Export Data',
            subtitle: 'Download your medical records',
            onTap: () => _exportData(),
          ),
        ],
      ),
    );
  }

  Widget _buildSupportSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const HugeIcon(
                icon: HugeIcons.strokeRoundedCustomerSupport,
                size: 20,
                color: Color(0xFF010A38),
                strokeWidth: 2,
              ),
              const SizedBox(width: 8),
              Text(
                'Support & Legal',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF010A38),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          _buildMenuTile(
            hugeIcon: HugeIcons.strokeRoundedHelpCircle,
            title: 'Help Center',
            subtitle: 'Get help with blockchain healthcare',
            onTap: () => _showHelpCenter(),
          ),

          _buildMenuTile(
            hugeIcon: HugeIcons.strokeRoundedMessage01,
            title: 'Contact Support',
            subtitle: 'Reach out to our support team',
            onTap: () => _contactSupport(),
          ),

          _buildMenuTile(
            hugeIcon: HugeIcons.strokeRoundedLegalDocument01,
            title: 'Terms & Privacy',
            subtitle: 'Review our terms and privacy policy',
            onTap: () => _showTermsAndPrivacy(),
          ),

          _buildMenuTile(
            hugeIcon: HugeIcons.strokeRoundedLogout01,
            title: 'Sign Out',
            subtitle: 'Securely sign out of your account',
            onTap: () => _signOut(),
            isDestructive: true,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(
    String label,
    String value,
    IconData? icon,
    List<List<dynamic>>? hugeIcon,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          icon != null
              ? Icon(icon, size: 16, color: Colors.grey[600]!)
              : HugeIcon(
                  icon: hugeIcon!,
                  size: 16,
                  color: Colors.grey[600]!,
                  strokeWidth: 2,
                ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  value,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: const Color(0xFF010A38),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuTile({
    IconData? icon,
    List<List<dynamic>>? hugeIcon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    bool isDestructive = false,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: isDestructive
                      ? Colors.red.withValues(alpha: 0.1)
                      : const Color(0xFF010A38).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: icon != null
                    ? Icon(
                        icon,
                        size: 20,
                        color: isDestructive
                            ? Colors.red
                            : const Color(0xFF010A38),
                        weight: 2,
                      )
                    : HugeIcon(
                        icon: hugeIcon!,
                        size: 20,
                        color: isDestructive
                            ? Colors.red
                            : const Color(0xFF010A38),
                        strokeWidth: 2,
                      ),
              ),

              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: isDestructive
                            ? Colors.red
                            : const Color(0xFF010A38),
                      ),
                    ),
                    Text(
                      subtitle,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),

              HugeIcon(
                icon: HugeIcons.strokeRoundedArrowRight01,
                size: 16,
                color: Colors.grey[400]!,
                strokeWidth: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  // Action Methods
  void _showQRCode() {
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
              'My QR Code',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF010A38),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: HugeIcon(
                  icon: HugeIcons.strokeRoundedQrCode01,
                  size: 100,
                  color: Colors.grey,
                  strokeWidth: 2,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Scan to share your blockchain health profile',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[600]),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _showSettings() {
    Get.snackbar(
      'Settings',
      'Opening advanced settings...',
      backgroundColor: const Color(0xFF010A38),
      colorText: Colors.white,
    );
  }

  void _copyWalletAddress() {
    Get.snackbar(
      'Copied',
      'Wallet address copied to clipboard',
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  void _openWalletManagement() {
    Get.snackbar(
      'Wallet',
      'Opening wallet management...',
      backgroundColor: const Color(0xFF010A38),
      colorText: Colors.white,
    );
  }

  void _showMedicalRecordHash() {
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
            Text(
              'Medical Record Hash',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF010A38),
              ),
            ),
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
                    'Blockchain Hash:',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF010A38),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    userProfile.medicalRecordHash,
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      color: const Color(0xFF010A38),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'This hash verifies the integrity of your medical records on the blockchain.',
              style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey[600]),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _showSmartContracts() {
    Get.snackbar(
      'Smart Contracts',
      'Viewing active smart contracts...',
      backgroundColor: const Color(0xFF010A38),
      colorText: Colors.white,
    );
  }

  void _showPrivateKeys() {
    Get.snackbar(
      'Private Keys',
      'Opening secure key management...',
      backgroundColor: const Color(0xFF010A38),
      colorText: Colors.white,
    );
  }

  void _editProfile() {
    Get.snackbar(
      'Edit Profile',
      'Opening profile editor...',
      backgroundColor: const Color(0xFF010A38),
      colorText: Colors.white,
    );
  }

  void _showNotificationSettings() {
    Get.snackbar(
      'Notifications',
      'Opening notification settings...',
      backgroundColor: const Color(0xFF010A38),
      colorText: Colors.white,
    );
  }

  void _showPrivacySettings() {
    Get.snackbar(
      'Privacy',
      'Opening privacy settings...',
      backgroundColor: const Color(0xFF010A38),
      colorText: Colors.white,
    );
  }

  void _exportData() {
    Get.snackbar(
      'Export Data',
      'Preparing your medical records for download...',
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  void _showHelpCenter() {
    Get.snackbar(
      'Help Center',
      'Opening help documentation...',
      backgroundColor: const Color(0xFF010A38),
      colorText: Colors.white,
    );
  }

  void _contactSupport() {
    Get.snackbar(
      'Support',
      'Opening support chat...',
      backgroundColor: const Color(0xFF010A38),
      colorText: Colors.white,
    );
  }

  void _showTermsAndPrivacy() {
    Get.snackbar(
      'Legal',
      'Opening terms and privacy policy...',
      backgroundColor: const Color(0xFF010A38),
      colorText: Colors.white,
    );
  }

  void _signOut() {
    Get.dialog(
      AlertDialog(
        title: Text(
          'Sign Out',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        content: Text(
          'Are you sure you want to sign out of your account?',
          style: GoogleFonts.poppins(),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text('Cancel', style: GoogleFonts.poppins()),
          ),
          ElevatedButton(
            onPressed: () {
              Get.back();
              Get.snackbar(
                'Signed Out',
                'You have been securely signed out',
                backgroundColor: Colors.red,
                colorText: Colors.white,
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: Text(
              'Sign Out',
              style: GoogleFonts.poppins(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

// Enums and Models
enum VerificationLevel { unverified, pending, verified }

class UserProfile {
  final String name;
  final String email;
  final String phone;
  final DateTime dateOfBirth;
  final String bloodType;
  final List<String> allergies;
  final String emergencyContact;
  final String walletAddress;
  final double walletBalance;
  final DateTime memberSince;
  final VerificationLevel verificationLevel;
  final String profileImage;
  final String medicalRecordHash;
  final String insuranceProvider;
  final String policyNumber;

  UserProfile({
    required this.name,
    required this.email,
    required this.phone,
    required this.dateOfBirth,
    required this.bloodType,
    required this.allergies,
    required this.emergencyContact,
    required this.walletAddress,
    required this.walletBalance,
    required this.memberSince,
    required this.verificationLevel,
    required this.profileImage,
    required this.medicalRecordHash,
    required this.insuranceProvider,
    required this.policyNumber,
  });
}
