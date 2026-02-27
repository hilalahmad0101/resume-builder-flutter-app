import 'package:flutter/material.dart';
import 'package:resumebuilder/utils/constants/colors.dart';

class EditorProgressBar extends StatelessWidget {
  const EditorProgressBar({
    super.key,
    required this.currentStep,
    required this.totalSteps,
    required this.stepTitle,
    required this.nextStepTitle,
  });

  final int currentStep;
  final int totalSteps;
  final String stepTitle;
  final String nextStepTitle;

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final double progress = currentStep / totalSteps;

    return Container(
      padding: const EdgeInsets.all(16),
      color: isDark ? UColors.backgroundDarkColor : Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Step $currentStep of $totalSteps',
                style: TextStyle(
                  color: isDark ? Colors.white : UColors.blackColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                stepTitle,
                style: const TextStyle(
                  color: UColors.primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            height: 8,
            width: double.infinity,
            decoration: BoxDecoration(
              color: isDark ? Colors.grey[700] : const Color(0xFFDBDFE6),
              borderRadius: BorderRadius.circular(4),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: progress,
              child: Container(
                decoration: BoxDecoration(
                  color: UColors.primaryColor,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            currentStep < totalSteps
                ? 'Next: $nextStepTitle'
                : 'Completion: 100%',
            style: TextStyle(color: UColors.grayColor, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
