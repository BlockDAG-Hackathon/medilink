import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_app/constants/utils.dart';
import 'package:hackathon_app/models/hospital_model.dart';
import 'package:hugeicons/hugeicons.dart';
import "package:flutter_svg/flutter_svg.dart";

class Hospital extends StatefulWidget {
  const Hospital({super.key});

  @override
  State<Hospital> createState() => _HospitalState();
}

class _HospitalState extends State<Hospital> with TickerProviderStateMixin {
  late TabController _tabController;
  String selectedDepartment = 'All';

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
          'Healthcare Network',
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
            onPressed: () => _showFilterModal(),
            icon: const HugeIcon(
              icon: HugeIcons.strokeRoundedFilterHorizontal,
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
            Tab(text: 'Doctors'),
            Tab(text: 'Departments'),
          ],
        ),
      ),
      body: Column(
        children: [
          // Blockchain Network Status
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
                    icon: HugeIcons.strokeRoundedBlockchain01,
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
                        'Network Status: Active',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'All medical records are blockchain-verified',
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
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'LIVE',
                    style: GoogleFonts.poppins(
                      color: Colors.green,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Tab Content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [_buildDoctorsTab(), _buildDepartmentsTab()],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDoctorsTab() {
    final filteredDoctors = selectedDepartment == 'All'
        ? Utils.doctors
        : Utils.doctors
              .where((doctor) => doctor.department == selectedDepartment)
              .toList();

    return Column(
      children: [
        // Department Filter
        Container(
          height: 50,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: Utils.departments.length,
            itemBuilder: (context, index) {
              final department = Utils.departments[index];
              final isSelected = selectedDepartment == department;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedDepartment = department;
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
                      department,
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

        // Doctors List
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: filteredDoctors.length,
            itemBuilder: (context, index) {
              final doctor = filteredDoctors[index];
              return _buildDoctorCard(doctor);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDoctorCard(Doctor doctor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
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
        children: [
          Row(
            children: [
              // Doctor Image
              Stack(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(doctor.image),
                  ),
                  if (doctor.isOnline)
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                      ),
                    ),
                ],
              ),

              const SizedBox(width: 16),

              // Doctor Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            doctor.name,
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF010A38),
                            ),
                          ),
                        ),
                        if (doctor.isVerified)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.blue.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const HugeIcon(
                                  icon: HugeIcons.strokeRoundedCheckmarkBadge01,
                                  size: 12,
                                  color: Colors.blue,
                                  strokeWidth: 2,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'Verified',
                                  style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),

                    const SizedBox(height: 4),

                    Text(
                      '${doctor.department} • ${doctor.specialization}',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Row(
                      children: [
                        const HugeIcon(
                          icon: HugeIcons.strokeRoundedStar,
                          size: 14,
                          color: Colors.amber,
                          strokeWidth: 2,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${doctor.rating}',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[700],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          '${doctor.experience} exp',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Blockchain Info & Actions
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF010A38).withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const HugeIcon(
                      icon: HugeIcons.strokeRoundedBlockchain01,
                      size: 16,
                      color: Color(0xFF010A38),
                      strokeWidth: 2,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Blockchain ID: ${doctor.blockchainId}',
                      style: GoogleFonts.poppins(
                        fontSize: 10,
                        color: const Color(0xFF010A38),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Consultation Fee',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            doctor.consultationFee,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: const Color(0xFF010A38),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Next Available',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            doctor.nextAvailable,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: doctor.isOnline
                                  ? Colors.green
                                  : Colors.orange,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => _showDoctorProfile(doctor),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          side: const BorderSide(color: Color(0xFF010A38)),
                        ),
                        child: Text(
                          'View Profile',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF010A38),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: ElevatedButton(
                        onPressed: doctor.isOnline
                            ? () => _bookConsultation(doctor)
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF010A38),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          doctor.isOnline ? 'Book Now' : 'Offline',
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
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDepartmentsTab() {
    final departmentData = [
      DepartmentInfo(
        name: 'Cardiology',
        iconString: Utils.heartIcon,
        doctorCount: 12,
        description: 'Heart and cardiovascular care',
        color: Colors.red,
        isEmergency: false,
      ),
      DepartmentInfo(
        name: 'Neurology',
        hugeIcon: HugeIcons.strokeRoundedBrain01,
        doctorCount: 8,
        description: 'Brain and nervous system',
        color: Colors.purple,
        isEmergency: false,
      ),
      DepartmentInfo(
        name: 'Pediatrics',
        hugeIcon: HugeIcons.strokeRoundedBaby01,
        doctorCount: 15,
        description: 'Children healthcare',
        color: Colors.pink,
        isEmergency: false,
      ),
      DepartmentInfo(
        name: 'Emergency',
        hugeIcon: HugeIcons.strokeRoundedAmbulance,
        doctorCount: 6,
        description: '24/7 emergency care',
        color: Colors.red,
        isEmergency: true,
      ),
      DepartmentInfo(
        name: 'Orthopedics',
        hugeIcon: HugeIcons.strokeRoundedBone01,
        doctorCount: 10,
        description: 'Bone and joint care',
        color: Colors.orange,
        isEmergency: false,
      ),
      DepartmentInfo(
        name: 'Dermatology',
        hugeIcon: HugeIcons.strokeRoundedBackMuscleBody,
        doctorCount: 7,
        description: 'Skin and hair care',
        color: Colors.green,
        isEmergency: false,
      ),
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: departmentData.length,
      itemBuilder: (context, index) {
        final department = departmentData[index];
        return _buildDepartmentCard(department);
      },
    );
  }

  Widget _buildDepartmentCard(DepartmentInfo department) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: department.color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: department.icon != null
                ? Icon(department.icon)
                : department.iconString != null
                // ignore: deprecated_member_use
                ? SvgPicture.string(
                    department.iconString!,
                    width: 32,
                    height: 32,
                    color: department.color,
                  )
                : HugeIcon(
                    icon: department.hugeIcon!,
                    size: 32,
                    color: department.color,
                    strokeWidth: 2,
                  ),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      department.name,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF010A38),
                      ),
                    ),
                    if (department.isEmergency)
                      Container(
                        margin: const EdgeInsets.only(left: 8),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '24/7',
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: Colors.red,
                          ),
                        ),
                      ),
                  ],
                ),

                const SizedBox(height: 4),

                Text(
                  department.description,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w400,
                  ),
                ),

                const SizedBox(height: 8),

                Row(
                  children: [
                    const HugeIcon(
                      icon: HugeIcons.strokeRoundedDoctor01,
                      size: 16,
                      color: Colors.grey,
                      strokeWidth: 2,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${department.doctorCount} doctors available',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const HugeIcon(
            icon: HugeIcons.strokeRoundedArrowRight01,
            size: 20,
            color: Colors.grey,
            strokeWidth: 2,
          ),
        ],
      ),
    );
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
                hintText: 'Search doctors, departments...',
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

  void _showFilterModal() {
    Get.snackbar(
      'Filter',
      'Filter options coming soon',
      backgroundColor: const Color(0xFF010A38),
      colorText: Colors.white,
    );
  }

  void _showDoctorProfile(Doctor doctor) {
    Get.snackbar(
      'Doctor Profile',
      'Viewing ${doctor.name}\'s blockchain-verified profile',
      backgroundColor: const Color(0xFF010A38),
      colorText: Colors.white,
    );
  }

  void _bookConsultation(Doctor doctor) {
    Get.snackbar(
      'Booking Consultation',
      'Initiating blockchain-secured booking with ${doctor.name}',
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }
}
