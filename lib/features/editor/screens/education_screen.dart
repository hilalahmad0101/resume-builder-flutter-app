import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resumebuilder/features/editor/widgets/editor_footer.dart';
import 'package:resumebuilder/features/editor/widgets/editor_progress_bar.dart';
import 'package:resumebuilder/routes/routes.dart';
import 'package:resumebuilder/utils/constants/colors.dart';
import 'package:resumebuilder/features/editor/screens/personal_info_screen.dart'; // for BorderBottom

class EducationScreen extends StatelessWidget {
  const EducationScreen({super.key});

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
          'Education',
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
            currentStep: 3,
            totalSteps: 4,
            stepTitle: 'Education',
            nextStepTitle: 'Skills',
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildExistingEducationList(isDark),
                  _buildAddButton(isDark),
                  _buildNewEntryForm(isDark),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: EditorFooter(
        onNext: () => Get.toNamed(URoutes.skillsLanguages),
        onBack: () => Get.back(),
      ),
    );
  }

  Widget _buildExistingEducationList(bool isDark) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF111827) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isDark ? Colors.white10 : const Color(0xFFDBDFE6),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: UColors.primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.school,
                color: UColors.primaryColor,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Master of Science in CS',
                        style: TextStyle(
                          color: isDark ? Colors.white : UColors.blackColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Icon(
                        Icons.edit,
                        size: 20,
                        color: UColors.grayColor,
                      ),
                    ],
                  ),
                  Text(
                    'Stanford University',
                    style: TextStyle(color: UColors.grayColor, fontSize: 14),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '2021 - 2023',
                    style: TextStyle(color: UColors.grayColor, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddButton(bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isDark ? Colors.white12 : const Color(0xFFDBDFE6),
            style: BorderStyle.solid,
            width: 2,
          ),
        ),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(12),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add_circle, color: UColors.primaryColor),
              SizedBox(width: 8),
              Text(
                'Add Education',
                style: TextStyle(
                  color: UColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNewEntryForm(bool isDark) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      color: isDark ? UColors.backgroundDarkColor : Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'New Entry',
              style: TextStyle(
                color: isDark ? Colors.white : UColors.blackColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          BorderBottom(isDark: isDark),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildFormInput(
                  isDark,
                  'Degree / Certification',
                  'e.g. Bachelor of Science',
                ),
                _buildFormInput(
                  isDark,
                  'School / University',
                  'e.g. Harvard University',
                ),
                _buildFormInput(
                  isDark,
                  'Graduation Year',
                  'YYYY',
                  keyboardType: TextInputType.number,
                  icon: Icons.calendar_today,
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormInput(
    bool isDark,
    String label,
    String hint, {
    TextInputType? keyboardType,
    IconData? icon,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
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
                  ? Icon(icon, color: UColors.grayColor, size: 20)
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
