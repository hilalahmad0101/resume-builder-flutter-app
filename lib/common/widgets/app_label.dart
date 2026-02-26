import 'package:flutter/material.dart';
import 'package:resumebuilder/utils/constants/colors.dart';

class AppLabel extends StatelessWidget {
  const AppLabel({super.key, required this.text, this.color});

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? UColors.blackColor,
        fontSize: 13,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.1,
      ),
    );
  }
}
