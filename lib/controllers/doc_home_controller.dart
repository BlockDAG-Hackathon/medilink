import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DocHomeController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  RxInt selectedIndex = 0.obs;

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
  
}