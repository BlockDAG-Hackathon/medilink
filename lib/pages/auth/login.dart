import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackathon_app/ui/btn.dart';
import '../../ui/input.dart';
import "package:hugeicons/hugeicons.dart";

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: HugeIcon(
          icon: HugeIcons.strokeRoundedExchange01,
          color: Colors.white,
          size: 20,
        ),
        title: Text(
          "DataVault",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(25),
        child: Column(
          spacing: 20,
          children: [
            Btn(
              onClick: () {},
              label: "Connect Wallet",
              fontWeight: FontWeight.w600,
              textColor: Colors.grey.shade100,
              bgColor: Color(0xFF026AC7),
            ),
            Text(
              'Or use private key',
              style: TextStyle(color: Colors.grey.shade100, fontSize: 16),
            ),
            Input(hintText: "Enter your email/username", isPassword: false),
            Input(hintText: "Enter your password", isPassword: true),
            SizedBox(height: Get.height * 0.03),
            Btn(
              onClick: () {},
              label: "Connect Wallet",
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}
