import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Note: Google Fonts import is needed to maintain the project's consistent typography
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';

// --- 1. GetX Controller for Navigation State ---
class HomeController extends GetxController {
  // Use .obs (Observable) for reactive state management
  final _selectedIndex = 0.obs;

  int get selectedIndex => _selectedIndex.value;

  // Navigation Item Data structure
  final List<Map<String, dynamic>> navItems = const [
    {'label': 'Home', 'icon': HugeIcons.strokeRoundedHome01, 'activeIcon': HugeIcons.strokeRoundedHome02},
    {
      'label': 'Complaints',
      'icon': Icons.medical_services_outlined,
      'activeIcon': Icons.medical_services,
    },
    {
      'label': 'Wallet',
      'icon': Icons.account_balance_wallet_outlined,
      'activeIcon': Icons.account_balance_wallet,
    },
  ];

  // Tab contents (moved here to centralize state logic)
  final List<Widget> widgetOptions = <Widget>[
    const Center(
      child: Text(
        "Home Dashboard Content",
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    ),
    const Center(
      child: Text(
        "Complaints & Diagnosis History",
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    ),
    const Center(
      child: Text(
        "Wallet & Payment Section",
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    ),
  ];

  void onItemTapped(int index) {
    _selectedIndex.value = index;
  }

  // Helper to dynamically set the AppBar title
  String getAppBarTitle() {
    switch (selectedIndex) {
      case 0:
        return "BlockDag Health";
      case 1:
        return "My Complaints";
      case 2:
        return "BlockDA Wallet";
      default:
        return "BlockDag Health";
    }
  }
}

// --- 2. HomeScreen is now a StatelessWidget (GetView for convenience) ---
class HomeScreen extends GetView<HomeController> {
   HomeScreen({super.key});

  // Inject the controller when the screen is built
  @override
  // Note: Get.put(HomeController()) ensures the controller is initialized
  // before the screen uses it. Use Get.find() if it's initialized elsewhere.
  final HomeController controller = Get.put(HomeController());

  // Custom Navigation Item Widget
  Widget _buildCustomNavBarItem(
    int index,
    String label,
    IconData icon,
    IconData activeIcon,
  ) {
    // Wrap the widget that depends on state in an Obx
    return Obx(() {
      final bool isSelected = index == controller.selectedIndex;
      // Bright green color used in previous files for accents
      const Color activeColor = Color(0xFF5DFE5D);
      final Color itemColor = isSelected
          ? activeColor
          : Colors.white.withOpacity(0.6);

      return Expanded(
        child: GestureDetector(
          onTap: () => controller.onItemTapped(index), // Call controller method
          child: Container(
            color: Colors.transparent, // Required for tap area
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  isSelected ? activeIcon : icon,
                  color: itemColor,
                  size: 26,
                ),
                const SizedBox(height: 4),
                Text(
                  label,
                  style: TextStyle(
                    color: itemColor,
                    fontSize: 12,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get the bottom padding (safe area) to correctly position the custom sheet
    final double bottomPadding = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      // Use a dark background consistent with previous files
      backgroundColor: const Color(0xFF041679),

      // AppBar with reactive title
      appBar: AppBar(
        title: Obx(() => Text(controller.getAppBarTitle())),
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),

      // Obx is used to reactively display the body content based on the selected tab
      body: Obx(
        () => controller.widgetOptions.elementAt(controller.selectedIndex),
      ),

      // Implement the custom navigation using Scaffold.bottomSheet
      bottomSheet: Container(
        // Use a very dark background color
        color: const Color(0xFF010A38),

        // Add padding to incorporate the safe area below the navigation items
        padding: EdgeInsets.only(
          top: 10,
          bottom: bottomPadding > 0 ? bottomPadding : 10,
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: controller.navItems.asMap().entries.map((entry) {
            final index = entry.key;
            final item = entry.value;
            return _buildCustomNavBarItem(
              index,
              item['label'] as String,
              item['icon'] as IconData,
              item['activeIcon'] as IconData,
            );
          }).toList(),
        ),
      ),
    );
  }
}
