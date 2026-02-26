import 'package:flutter/material.dart';

class EmailVerifyIcon extends StatelessWidget {
  const EmailVerifyIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 128,
      height: 128,
      child: Stack(
        children: [
          // Circle background
          Container(
            width: 128,
            height: 128,
            decoration: BoxDecoration(
              color: const Color(0xFF135BEC).withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.mark_email_unread_outlined,
              color: Color(0xFF135BEC),
              size: 64,
            ),
          ),
          // Verified badge
          Positioned(
            bottom: 4,
            right: 4,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: const Color(0xFF135BEC),
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFFF6F6F8), width: 3),
              ),
              child: const Icon(
                Icons.verified_user_outlined,
                color: Colors.white,
                size: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
