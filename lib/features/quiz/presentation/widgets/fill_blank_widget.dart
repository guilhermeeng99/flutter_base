import 'package:flutter/material.dart';
import 'package:flutter_base/app/theme/app_colors.dart';

class FillBlankWidget extends StatelessWidget {
  const FillBlankWidget({
    required this.options,
    required this.onSelected,
    this.selectedIndex,
    this.correctAnswerIndex,
    this.isAnswered = false,
    super.key,
  });

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
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.border,
                width: 2,
              ),
            ),
            child: Text(
              selectedIndex != null ? options[selectedIndex!] : '________',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: selectedIndex != null
                    ? AppColors.primary
                    : AppColors.disabled,
              ),
            ),
          ),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: options.asMap().entries.map((entry) {
              final index = entry.key;
              final option = entry.value;
              final isSelected = selectedIndex == index;
              final isCorrect = isAnswered && index == correctAnswerIndex;
              final isWrong =
                  isAnswered && isSelected && index != correctAnswerIndex;

              Color chipColor;
              if (isCorrect) {
                chipColor = AppColors.success;
              } else if (isWrong) {
                chipColor = AppColors.error;
              } else if (isSelected) {
                chipColor = AppColors.primary;
              } else {
                chipColor = AppColors.textSecondary;
              }

              return ActionChip(
                label: Text(
                  option,
                  style: TextStyle(
                    color: isSelected ? Colors.white : chipColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                backgroundColor: isSelected
                    ? chipColor
                    : chipColor.withValues(alpha: 0.1),
                side: BorderSide(color: chipColor),
                onPressed: isAnswered ? null : () => onSelected(index),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
