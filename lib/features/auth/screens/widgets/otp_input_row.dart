import 'package:flutter/material.dart';
import 'package:resumebuilder/features/auth/screens/widgets/otp_box.dart';

class OtpInputRow extends StatelessWidget {
  const OtpInputRow({
    super.key,
    required this.controllers,
    required this.focusNodes,
  });

  final List<TextEditingController> controllers;
  final List<FocusNode> focusNodes;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(6, (i) {
        return OtpBox(
          controller: controllers[i],
          focusNode: focusNodes[i],
          nextFocus: i < 5 ? focusNodes[i + 1] : null,
          prevFocus: i > 0 ? focusNodes[i - 1] : null,
        );
      }),
    );
  }
}
