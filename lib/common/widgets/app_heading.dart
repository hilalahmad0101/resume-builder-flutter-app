import 'package:flutter/material.dart';
import 'package:resumebuilder/utils/constants/colors.dart';

class AppHeading extends StatelessWidget {
  const AppHeading({super.key, required this.text, this.color});

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? UColors.blackColor,
        fontSize: 28,
        fontWeight: FontWeight.w800,
        letterSpacing: -0.5,
        height: 1.2,
      ),
    );
  }
}
