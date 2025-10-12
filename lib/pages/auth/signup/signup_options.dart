import 'package:flutter/material.dart';
import 'package:hackathon_app/ui/btn.dart';
import 'package:hackathon_app/ui/deep_blue_gradient_background.dart';

class SignupOptionsScreen extends StatelessWidget {
  const SignupOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: Stack(
        children: [
          DeepBlueGradientBackground(),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Create a New Wallet",
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "Generate a secure wallet to access you data",
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Btn(
                onClick: () {},
                label: "Create new wallet",
                fontWeight: FontWeight.w500,
                fontSize: 19.99,
              ),
              Row(
                spacing: 10,
                children: [
                  Expanded(
                    child: Container(height: 1.5, color: Color(0xFFFFFFFF)),
                  ),
                  Text(
                    "Or Sign up with",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                    ),
                  ),
                  Expanded(
                    child: Container(height: 1.5, color: Color(0xFFFFFFFF)),
                  ),
                ],
              ),

              Row(
                children: [
                  Expanded(
                    child: Btn(
                      onClick: () {},
                      label: "Google",
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      textColor: Colors.white,

                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
