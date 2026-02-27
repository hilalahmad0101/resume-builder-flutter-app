import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resumebuilder/common/widgets/dashboard_bottom_nav.dart';
import 'package:resumebuilder/routes/routes.dart';
import 'package:resumebuilder/utils/constants/colors.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _autoSave = true;

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark
          ? UColors.backgroundDarkColor
          : UColors.backgroundLightColor,
      appBar: AppBar(
        backgroundColor: isDark ? UColors.backgroundDarkColor : Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios, size: 20),
          color: isDark ? Colors.white : Colors.black,
        ),
        title: Text(
          'Settings',
          style: TextStyle(
            color: isDark ? Colors.white : Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            height: 1,
            color: isDark ? Colors.white10 : const Color(0xFFDBDFE6),
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 100),
            child: Column(
              children: [
                _buildProfileSection(isDark),
                const SizedBox(height: 24),
                _buildSectionHeader('Account'),
                _buildSettingsGroup(isDark, [
                  _buildSettingsItem(
                    isDark,
                    icon: Icons.workspace_premium_outlined,
                    title: 'Subscription Plan',
                    subtitle: 'Premium • Renews Oct 12, 2023',
                    iconColor: UColors.primaryColor,
                    iconBgColor: UColors.primaryColor.withOpacity(0.1),
                    onTap: () {},
                  ),
                  _buildSettingsItem(
                    isDark,
                    icon: Icons.lock_outline_rounded,
                    title: 'Email & Password',
                    subtitle: 'Change login credentials',
                    onTap: () {},
                    showDivider: false,
                  ),
                ]),
                const SizedBox(height: 24),
                _buildSectionHeader('Preferences'),
                _buildSettingsGroup(isDark, [
                  _buildSettingsItem(
                    isDark,
                    icon: Icons.language_outlined,
                    title: 'Language',
                    trailing: Text(
                      'English',
                      style: TextStyle(color: UColors.grayColor, fontSize: 14),
                    ),
                    onTap: () {},
                  ),
                  _buildSettingsToggle(
                    isDark,
                    icon: Icons.cloud_upload_outlined,
                    title: 'Auto-save',
                    value: _autoSave,
                    onChanged: (val) {
                      setState(() {
                        _autoSave = val;
                      });
                    },
                    showDivider: false,
                  ),
                ]),
                const SizedBox(height: 24),
                _buildSectionHeader('Support'),
                _buildSettingsGroup(isDark, [
                  _buildSettingsItem(
                    isDark,
                    icon: Icons.help_outline_rounded,
                    title: 'Help Center',
                    onTap: () {},
                  ),
                  _buildSettingsItem(
                    isDark,
                    icon: Icons.policy_outlined,
                    title: 'Privacy Policy',
                    onTap: () {},
                    showDivider: false,
                  ),
                ]),
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () => Get.offAllNamed(URoutes.login),
                      icon: const Icon(Icons.logout, color: Colors.red),
                      label: const Text(
                        'Log Out',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        side: BorderSide(
                          color: isDark
                              ? Colors.white10
                              : const Color(0xFFDBDFE6),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: isDark
                            ? const Color(0xFF1E293B)
                            : Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'VERSION 2.4.1 (1024)',
                  style: TextStyle(
                    color: UColors.grayColor.withOpacity(0.6),
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const DashboardBottomNav(selectedIndex: 3),
    );
  }

  Widget _buildProfileSection(bool isDark) {
    return Container(
      color: isDark ? const Color(0xFF1E293B).withOpacity(0.5) : Colors.white,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 96,
                height: 96,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: UColors.primaryColor.withOpacity(0.2),
                    width: 2,
                  ),
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuA7PUogcTW4t3vUxmsX5oHiBzDmycdc0z8OLg3eaYIq5KOEKVmg-cMGU9d3Fh_Ec0PiaMZJ54UUkZ9YZVvaDllQscV7Fho3ueyHEdFf2X1Jz_pCYRYmzCtAknDv1SrSRuU6Q734oBLRWE9HY1maf2pWrGoP01Wteg5MXyu8n_hhZxwbybSiB4_kDs0Pc5GYznrDd16Q7dEIdv8QjuJVrUftaZV7H-skVchQEk7qRtewJklKESstFB-GR0hNA5z80otoh7M1PHzlpp1v',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: UColors.primaryColor,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isDark
                          ? UColors.backgroundDarkColor
                          : Colors.white,
                      width: 2,
                    ),
                  ),
                  child: const Icon(Icons.edit, color: Colors.white, size: 14),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Alex Johnson',
            style: TextStyle(
              color: isDark ? Colors.white : UColors.blackColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'alex.johnson@email.com',
            style: TextStyle(color: UColors.grayColor, fontSize: 14),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: UColors.primaryColor.withOpacity(0.1),
              foregroundColor: UColors.primaryColor,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Edit Profile',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          color: UColors.grayColor,
          fontSize: 12,
          fontWeight: FontWeight.w600,
          letterSpacing: 1,
        ),
      ),
    );
  }

  Widget _buildSettingsGroup(bool isDark, List<Widget> children) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: isDark ? UColors.backgroundDarkColor : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? Colors.white10 : const Color(0xFFE5E7EB),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }

  Widget _buildSettingsItem(
    bool isDark, {
    required IconData icon,
    required String title,
    String? subtitle,
    Widget? trailing,
    Color? iconColor,
    Color? iconBgColor,
    required VoidCallback onTap,
    bool showDivider = true,
  }) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 4,
          ),
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color:
                  iconBgColor ??
                  (isDark ? const Color(0xFF1E293B) : const Color(0xFFF3F4F6)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color:
                  iconColor ??
                  (isDark ? const Color(0xFF94A3B8) : const Color(0xFF475569)),
              size: 22,
            ),
          ),
          title: Text(
            title,
            style: TextStyle(
              color: isDark ? Colors.white : UColors.blackColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: subtitle != null
              ? Text(
                  subtitle,
                  style: TextStyle(color: UColors.grayColor, fontSize: 12),
                )
              : null,
          trailing:
              trailing ??
              Icon(
                Icons.chevron_right,
                color: UColors.grayColor.withOpacity(0.5),
                size: 20,
              ),
        ),
        if (showDivider)
          Divider(
            height: 1,
            indent: 72,
            color: isDark ? Colors.white10 : const Color(0xFFF3F4F6),
          ),
      ],
    );
  }

  Widget _buildSettingsToggle(
    bool isDark, {
    required IconData icon,
    required String title,
    required bool value,
    required Function(bool) onChanged,
    bool showDivider = true,
  }) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: isDark
                      ? const Color(0xFF1E293B)
                      : const Color(0xFFF3F4F6),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  color: isDark
                      ? const Color(0xFF94A3B8)
                      : const Color(0xFF475569),
                  size: 22,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: isDark ? Colors.white : UColors.blackColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Switch(
                value: value,
                onChanged: onChanged,
                activeColor: UColors.primaryColor,
                activeTrackColor: UColors.primaryColor.withOpacity(0.2),
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: isDark
                    ? Colors.white10
                    : const Color(0xFFE2E8F0),
              ),
            ],
          ),
        ),
        if (showDivider)
          Divider(
            height: 1,
            indent: 72,
            color: isDark ? Colors.white10 : const Color(0xFFF3F4F6),
          ),
      ],
    );
  }
}
