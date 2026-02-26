import 'package:flutter/material.dart';
import 'package:resumebuilder/utils/constants/colors.dart';

class AppSubtitle extends StatelessWidget {
  const AppSubtitle({super.key, required this.text, this.color});

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? UColors.grayColor,
        fontSize: 15,
        fontWeight: FontWeight.w400,
        height: 1.5,
      ),
    );
  }
}
