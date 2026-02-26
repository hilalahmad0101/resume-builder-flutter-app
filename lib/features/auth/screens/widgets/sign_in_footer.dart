import 'package:flutter/material.dart';

class SignInFooter extends StatelessWidget {
  const SignInFooter({super.key, this.onSignIn});

  final VoidCallback? onSignIn;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Already have an account?',
          style: TextStyle(
            color: Color(0xFF616F89),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 4),
        GestureDetector(
          onTap: onSignIn ?? () {},
          child: const Text(
            'Sign In',
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
