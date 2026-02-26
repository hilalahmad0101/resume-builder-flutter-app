import 'package:flutter/material.dart';

class ResendCodeWidget extends StatelessWidget {
  const ResendCodeWidget({super.key, this.onResend});

  final VoidCallback? onResend;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Didn't receive the code?",
          style: TextStyle(color: Color(0xFF616F89), fontSize: 14),
        ),
        const SizedBox(height: 4),
        GestureDetector(
          onTap: onResend ?? () {},
          child: const Text(
            'Resend Code',
            style: TextStyle(
              color: Color(0xFF135BEC),
              fontSize: 14,
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.underline,
              decorationColor: Color(0xFF135BEC),
            ),
          ),
        ),
      ],
    );
  }
}
