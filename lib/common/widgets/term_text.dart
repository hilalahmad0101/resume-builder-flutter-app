import 'package:flutter/material.dart';

class TermsText extends StatelessWidget {
  const TermsText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'By signing up, you agree to our Terms of Service and Privacy Policy',
      textAlign: TextAlign.center,
      style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 11, height: 1.5),
    );
  }
}
