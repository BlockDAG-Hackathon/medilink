import 'package:flutter/material.dart';

class DeepBlueGradientBackground extends StatelessWidget {
  const DeepBlueGradientBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.topCenter,

          radius: 1.5,

          colors: [Color(0xFF026AC7), Color(0xFF041679), Color(0xFF030D43)],
          stops: [0.0, 0.3, 1.0],
        ),
      ),
    );
  }
}
