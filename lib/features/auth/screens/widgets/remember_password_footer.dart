import 'package:flutter/material.dart';

class RememberPasswordFooter extends StatelessWidget {
  const RememberPasswordFooter({super.key, this.onSignIn});

  final VoidCallback? onSignIn;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSignIn ?? () {},
      child: RichText(
        textAlign: TextAlign.center,
        text: const TextSpan(
          style: TextStyle(
            color: Color(0xFF616F89),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          children: [
            TextSpan(text: 'Remember your password? '),
            TextSpan(
              text: 'Sign In',
              style: TextStyle(
                color: Color(0xFF135BEC),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
