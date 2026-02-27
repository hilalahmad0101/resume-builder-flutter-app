import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resumebuilder/features/editor/widgets/editor_footer.dart';
import 'package:resumebuilder/features/editor/widgets/editor_progress_bar.dart';
import 'package:resumebuilder/routes/routes.dart';
import 'package:resumebuilder/utils/constants/colors.dart';
import 'package:resumebuilder/features/editor/screens/personal_info_screen.dart'; // for BorderBottom

class WorkExperienceScreen extends StatelessWidget {
  const WorkExperienceScreen({super.key});

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
          'Work Experience',
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
            currentStep: 2,
            totalSteps: 4,
            stepTitle: 'Work Experience',
            nextStepTitle: 'Education, Skills',
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildExistingExperienceList(isDark),
                  _buildAddButton(isDark),
                  _buildNewRoleForm(isDark),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: EditorFooter(
        onNext: () => Get.toNamed(URoutes.education),
        onBack: () => Get.back(),
      ),
    );
  }

  Widget _buildExistingExperienceList(bool isDark) {
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Senior Developer',
                  style: TextStyle(
                    color: isDark ? Colors.white : UColors.blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'TechCorp • Jan 2021 — Present',
                  style: TextStyle(color: UColors.grayColor, fontSize: 14),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.edit,
                    size: 20,
                    color: UColors.grayColor,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.delete, size: 20, color: Colors.red),
                ),
              ],
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
            color: UColors.primaryColor.withOpacity(0.3),
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
                'Add Experience',
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

  Widget _buildNewRoleForm(bool isDark) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      color: isDark ? UColors.backgroundDarkColor : Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'New Role',
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
                _buildFormInput(isDark, 'Job Title', 'e.g. Project Manager'),
                _buildFormInput(isDark, 'Company', 'e.g. Global Tech Inc.'),
                Row(
                  children: [
                    Expanded(
                      child: _buildFormInput(
                        isDark,
                        'Start Date',
                        'YYYY-MM-DD',
                        isDate: true,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildFormInput(
                        isDark,
                        'End Date',
                        'YYYY-MM-DD',
                        isDate: true,
                      ),
                    ),
                  ],
                ),
                _buildTextArea(
                  isDark,
                  'Key Achievements',
                  'Describe your main responsibilities and accomplishments...',
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
    bool isDate = false,
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
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: UColors.grayColor, fontSize: 16),
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
              suffixIcon: isDate
                  ? const Icon(
                      Icons.calendar_today,
                      size: 20,
                      color: UColors.grayColor,
                    )
                  : null,
            ),
            style: TextStyle(color: isDark ? Colors.white : UColors.blackColor),
          ),
        ],
      ),
    );
  }

  Widget _buildTextArea(bool isDark, String label, String hint) {
    return Column(
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
          maxLines: 5,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: UColors.grayColor, fontSize: 16),
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
        const SizedBox(height: 4),
        Text(
          'Tip: Use bullet points to highlight your impact.',
          style: TextStyle(color: UColors.grayColor, fontSize: 12),
        ),
      ],
    );
  }
}
