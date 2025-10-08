import 'package:get/get.dart';
import 'package:hackathon_app/pages/home/screens/home_tab.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:flutter/material.dart';
class HomeController extends GetxController {
  // Use .obs (Observable) for reactive state management
  final _selectedIndex = 0.obs;

  int get selectedIndex => _selectedIndex.value;

  // Navigation Item Data structure
  final List<Map<String, dynamic>> navItems = const [
    {'label': 'Home', 'icon': HugeIcons.strokeRoundedHome04, 'activeIcon': HugeIcons.strokeRoundedHome04},
    {
      'label': 'Hospital',
      'icon': HugeIcons.strokeRoundedHospital02,
      'activeIcon': Icons.medical_services,
    },
    {
      'label': 'Inbox',
      'icon': HugeIcons.strokeRoundedMessage02,
      'activeIcon': Icons.inbox,
    },
    {
      'label': 'Me',
      'icon': HugeIcons.strokeRoundedSmile,
      'activeIcon': HugeIcons.strokeRoundedSmile,
    },
  ];

  // Tab contents (moved here to centralize state logic)
  final List<Widget> widgetOptions = <Widget>[
    HomeTab(),
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
