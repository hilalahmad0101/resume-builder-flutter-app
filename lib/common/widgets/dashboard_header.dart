import 'package:flutter/material.dart';
import 'package:resumebuilder/utils/constants/colors.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({
    super.key,
    required this.title,
    this.onProfileTap,
    this.onNotificationTap,
    this.profileImageUrl =
        'https://lh3.googleusercontent.com/aida-public/AB6AXuCzAlBEhPFk5J2N5kc3vQk6JW0-_2N-sgmPy65o7OlZtjjimQLv0VzhGe-c4hWIf1NFxLHWo_UwGdP2WrpDGKgVJ6NEZK-7Il4thxkOvDVaJQdMc1vCsGmjn-gbIlJCwr32bVWRNcRuV0F3y6ZxWMK7qR5INEdkGUTTyQLDHrsBo1gK3q-2lvqOTDBerX3Y3dJSqpXP8DuKNKncRdt-V0T9pCRGv8CiUhar2MRqLuxB2gN5YZUA6gOZUSHoAeX8PePuDeUHQkvzltGd',
  });

  final String title;
  final VoidCallback? onProfileTap;
  final VoidCallback? onNotificationTap;
  final String profileImageUrl;

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onProfileTap,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: UColors.primaryColor.withOpacity(0.1),
                  width: 2,
                ),
              ),
              child: CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage(profileImageUrl),
              ),
            ),
          ),
          Text(
            title,
            style: TextStyle(
              color: isDark ? UColors.textDarkColor : UColors.textLightColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.5,
            ),
          ),
          IconButton(
            onPressed: onNotificationTap,
            icon: const Icon(Icons.notifications_outlined),
            color: isDark ? UColors.textDarkColor : UColors.textLightColor,
          ),
        ],
      ),
    );
  }
}
