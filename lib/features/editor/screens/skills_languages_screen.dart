import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resumebuilder/features/editor/widgets/editor_footer.dart';
import 'package:resumebuilder/features/editor/widgets/editor_progress_bar.dart';
import 'package:resumebuilder/routes/routes.dart';
import 'package:resumebuilder/utils/constants/colors.dart';
import 'package:resumebuilder/features/editor/screens/personal_info_screen.dart'; // for BorderBottom

class SkillsLanguagesScreen extends StatelessWidget {
  const SkillsLanguagesScreen({super.key});

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
          'Skills & Languages',
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
            currentStep: 4,
            totalSteps: 4,
            stepTitle: 'Skills & Languages',
            nextStepTitle: 'Done',
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildSkillsSection(isDark),
                  _buildLanguagesSection(isDark),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: EditorFooter(
        nextLabel: 'Finish',
        nextIcon: Icons.check_circle,
        onNext: () {
          Get.toNamed(URoutes.previewExport);
        },
        onBack: () => Get.back(),
      ),
    );
  }

  Widget _buildSkillsSection(bool isDark) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(16),
      color: isDark ? UColors.backgroundDarkColor : Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Core Skills',
            style: TextStyle(
              color: isDark ? Colors.white : UColors.blackColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              hintText: 'Search skills (e.g. Python, UI Design)',
              hintStyle: TextStyle(color: UColors.grayColor, fontSize: 14),
              prefixIcon: const Icon(Icons.search, color: UColors.grayColor),
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
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildSkillChip('Python'),
              _buildSkillChip('Project Management'),
              _buildSkillChip('User Research'),
              _buildSkillChip('Agile'),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Suggested: Data Analysis, Figma, SQL, React',
            style: TextStyle(color: UColors.grayColor, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: UColors.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: UColors.primaryColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 4),
          const Icon(Icons.close, size: 14, color: UColors.primaryColor),
        ],
      ),
    );
  }

  Widget _buildLanguagesSection(bool isDark) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(16),
      color: isDark ? UColors.backgroundDarkColor : Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Languages',
            style: TextStyle(
              color: isDark ? Colors.white : UColors.blackColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildLanguageRow(isDark, 'English', 'Native'),
          const SizedBox(height: 12),
          _buildLanguageRow(isDark, 'Spanish', 'Professional'),
          const SizedBox(height: 16),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add_circle, size: 20),
            label: const Text('Add Language'),
            style: TextButton.styleFrom(
              foregroundColor: UColors.primaryColor,
              textStyle: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildLanguageRow(bool isDark, String language, String proficiency) {
    return Row(
      children: [
        Expanded(child: _buildDropDown(isDark, language)),
        const SizedBox(width: 12),
        Expanded(child: _buildDropDown(isDark, proficiency)),
        const SizedBox(width: 8),
        Icon(Icons.delete, color: UColors.grayColor, size: 20),
      ],
    );
  }

  Widget _buildDropDown(bool isDark, String value) {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF111827) : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isDark ? Colors.white12 : const Color(0xFFDBDFE6),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            value,
            style: TextStyle(
              color: isDark ? Colors.white : UColors.blackColor,
              fontSize: 14,
            ),
          ),
          const Icon(Icons.keyboard_arrow_down, color: UColors.grayColor),
        ],
      ),
    );
  }
}
