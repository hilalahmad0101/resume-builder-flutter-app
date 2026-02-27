import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resumebuilder/features/editor/widgets/editor_footer.dart';
import 'package:resumebuilder/features/editor/widgets/editor_progress_bar.dart';
import 'package:resumebuilder/routes/routes.dart';
import 'package:resumebuilder/utils/constants/colors.dart';

class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({super.key});

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
          'Personal Information',
          style: TextStyle(
            color: isDark ? Colors.white : Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        bottom: BorderBottom(isDark: isDark),
      ),
      body: Column(
        children: [
          const EditorProgressBar(
            currentStep: 1,
            totalSteps: 4,
            stepTitle: 'Info',
            nextStepTitle: 'Experience, Education, Skills',
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [_buildProfileHeader(isDark), _buildForm(isDark)],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: EditorFooter(
        onNext: () => Get.toNamed(URoutes.workExperience),
        onBack: () => Get.back(),
      ),
    );
  }

  Widget _buildProfileHeader(bool isDark) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: isDark ? UColors.backgroundDarkColor : Colors.white,
        border: Border(
          bottom: BorderSide(
            color: isDark ? Colors.white10 : const Color(0xFFDBDFE6),
          ),
        ),
      ),
      child: Center(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: UColors.primaryColor.withOpacity(0.1),
                      width: 4,
                    ),
                    image: const DecorationImage(
                      image: NetworkImage(
                        'https://lh3.googleusercontent.com/aida-public/AB6AXuDboMWNKKjt2jCxemyVSoELU3fgxUFRrk335sevFKkucusECH2dCYwynZ5mghKiB3REmqhkdKI2I4NqYATBsKmdRwd62Gy1NGqpphSn-p1lFk2ZtWBF5Ihz4fg68DU4z1KdeIoloS3mNZoy2QoxQjTCxwW9mdu0ARYZzPkJJQpHOl9jS_WyCu3P6M1HCaH_FGzjuonFMH8PlURpjswNlkpo06ZEVIHP_EUkYxFthuHzFYSnQMcFsdXLPpHWaqawu_KEWCPm4roQPyyg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 4,
                  right: 4,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: UColors.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.add_a_photo,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Edit Photo',
              style: TextStyle(
                color: UColors.primaryColor,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'A professional photo increases views by 3x',
              style: TextStyle(color: UColors.grayColor, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildForm(bool isDark) {
    return Container(
      color: isDark ? UColors.backgroundDarkColor : Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          _buildTextField(isDark, 'Full Name', 'e.g. John Doe'),
          _buildTextField(
            isDark,
            'Professional Title',
            'e.g. Senior Software Engineer',
          ),
          _buildTextField(
            isDark,
            'Email Address',
            'name@example.com',
            keyboardType: TextInputType.emailAddress,
          ),
          _buildTextField(
            isDark,
            'Phone Number',
            '+1 (555) 000-0000',
            keyboardType: TextInputType.phone,
          ),
          _buildTextField(
            isDark,
            'Location',
            'San Francisco, CA',
            icon: Icons.location_on,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildTextField(
    bool isDark,
    String label,
    String hint, {
    IconData? icon,
    TextInputType? keyboardType,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: isDark ? Colors.white : UColors.blackColor,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            keyboardType: keyboardType,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: UColors.grayColor, fontSize: 16),
              prefixIcon: icon != null
                  ? Icon(icon, color: UColors.grayColor)
                  : null,
              filled: true,
              fillColor: isDark ? const Color(0xFF111827) : Colors.white,
              contentPadding: const EdgeInsets.all(15),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: isDark ? Colors.grey[800]! : const Color(0xFFDBDFE6),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: UColors.primaryColor,
                  width: 2,
                ),
              ),
            ),
            style: TextStyle(color: isDark ? Colors.white : UColors.blackColor),
          ),
        ],
      ),
    );
  }
}

class BorderBottom extends StatelessWidget implements PreferredSizeWidget {
  const BorderBottom({super.key, required this.isDark});
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      color: isDark ? Colors.white10 : const Color(0xFFDBDFE6),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(1);
}
