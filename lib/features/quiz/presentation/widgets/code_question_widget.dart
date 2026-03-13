import 'package:flutter/material.dart';
import 'package:flutter_base/app/theme/app_colors.dart';
import 'package:flutter_base/app/theme/app_text_styles.dart';

class CodeQuestionWidget extends StatelessWidget {
  const CodeQuestionWidget({
    required this.codeSnippet,
    required this.options,
    required this.onSelected,
    this.selectedIndex,
    this.correctAnswerIndex,
    this.isAnswered = false,
    super.key,
  });

  final String codeSnippet;
  final List<String> options;
  final ValueChanged<int> onSelected;
  final int? selectedIndex;
  final int? correctAnswerIndex;
  final bool isAnswered;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: const Color(0xFF1E1E1E),
              borderRadius: BorderRadius.circular(12),
            ),
            child: SelectableText(
              codeSnippet,
              style: AppTextStyles.code.copyWith(
                color: const Color(0xFFD4D4D4),
                height: 1.5,
              ),
            ),
          ),
          ...options.asMap().entries.map((entry) {
            final index = entry.key;
            final option = entry.value;
            final isSelected = selectedIndex == index;
            final isCorrect = isAnswered && index == correctAnswerIndex;
            final isWrong =
                isAnswered && isSelected && index != correctAnswerIndex;

            Color borderColor;
            if (isCorrect) {
              borderColor = AppColors.success;
            } else if (isWrong) {
              borderColor = AppColors.error;
            } else if (isSelected) {
              borderColor = AppColors.primary;
            } else {
              borderColor = AppColors.border;
            }

            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Material(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(12),
                child: InkWell(
                  onTap: isAnswered ? null : () => onSelected(index),
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: borderColor, width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      option,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: isSelected
                            ? FontWeight.w700
                            : FontWeight.w500,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
