import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackathon_app/controllers/doc_home_controller.dart';
import 'package:hackathon_app/pages/doctor/tabs/patients_tab.dart';
import 'package:hackathon_app/pages/doctor/tabs/consultations_tab.dart';
import 'package:hackathon_app/ui/deep_blue_gradient_background.dart';
import 'widgets/doctor_home_content.dart';
import 'widgets/doctor_bottom_nav.dart';

class DocHome extends StatelessWidget {
  final controller = Get.put(DocHomeController());

  DocHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          DeepBlueGradientBackground(),
          Obx(() {
            switch (controller.selectedIndex.value) {
              case 0:
                return const DoctorHomeContent();
              case 1:
                return const PatientsTab();
              case 2:
                return const DoctorConsultationsTab();
              default:
                return const DoctorHomeContent();
            }
          }),
        ],
      ),
      bottomSheet: DoctorBottomNav(),
    );
  }
}
