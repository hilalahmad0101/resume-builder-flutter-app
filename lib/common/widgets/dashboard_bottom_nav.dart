import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resumebuilder/routes/routes.dart';
import 'package:resumebuilder/utils/constants/colors.dart';

class DashboardBottomNav extends StatelessWidget {
  const DashboardBottomNav({
    super.key,
    required this.selectedIndex,
    this.onTap,
  });

  final int selectedIndex;
  final Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.only(bottom: 20, top: 10),
      decoration: BoxDecoration(
        color: isDark
            ? UColors.backgroundDarkColor.withOpacity(0.9)
            : Colors.white.withOpacity(0.9),
        border: Border(
          top: BorderSide(
            color: isDark ? Colors.white10 : Colors.black.withOpacity(0.05),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(Icons.dashboard_rounded, 'Home', 0, isDark),
          _navItem(Icons.description_outlined, 'Templates', 1, isDark),
          _navItem(Icons.bolt_rounded, 'Jobs', 2, isDark),
          _navItem(Icons.settings_outlined, 'Settings', 3, isDark),
        ],
      ),
    );
  }

  Widget _navItem(IconData icon, String label, int index, bool isDark) {
    final bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!(index);
        } else {
          _handleNavigation(index);
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? UColors.primaryColor : UColors.grayColor,
            size: 26,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? UColors.primaryColor : UColors.grayColor,
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  void _handleNavigation(int index) {
    switch (index) {
      case 0:
        if (Get.currentRoute != URoutes.home) Get.offAllNamed(URoutes.home);
        break;
      case 1:
        if (Get.currentRoute != URoutes.templates)
          Get.toNamed(URoutes.templates);
        break;
      case 2:
        // Get.toNamed(URoutes.jobs);
        break;
      case 3:
        // Get.toNamed(URoutes.settings);
        break;
    }
  }
}
