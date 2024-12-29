import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  final double scale;
  final Color color;

  const Indicator({super.key, required this.scale, required this.color});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: CircularProgressIndicator(
        strokeWidth: 4,
        valueColor: AlwaysStoppedAnimation<Color>(color),
      ),
    );
  }
}
