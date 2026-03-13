import 'package:flutter/material.dart';
import 'package:flutter_base/app/theme/app_colors.dart';

class MultipleChoiceWidget extends StatelessWidget {
  const MultipleChoiceWidget({
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
        children: options.asMap().entries.map((entry) {
          final index = entry.key;
          final option = entry.value;
          final isSelected = selectedIndex == index;
          final isCorrect = isAnswered && index == correctAnswerIndex;
          final isWrong =
              isAnswered && isSelected && index != correctAnswerIndex;

          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _OptionButton(
              text: option,
              isSelected: isSelected,
              isCorrect: isCorrect,
              isWrong: isWrong,
              isAnswered: isAnswered,
              onTap: () => onSelected(index),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _OptionButton extends StatelessWidget {
  const _OptionButton({
    required this.text,
    required this.isSelected,
    required this.isCorrect,
    required this.isWrong,
    required this.isAnswered,
    required this.onTap,
  });

  final String text;
  final bool isSelected;
  final bool isCorrect;
  final bool isWrong;
  final bool isAnswered;
  final VoidCallback onTap;

  Color get _borderColor {
    if (isCorrect) return AppColors.success;
    if (isWrong) return AppColors.error;
    if (isSelected) return AppColors.primary;
    return AppColors.border;
  }

  Color get _backgroundColor {
    if (isCorrect) return AppColors.success.withValues(alpha: 0.1);
    if (isWrong) return AppColors.error.withValues(alpha: 0.1);
    if (isSelected) return AppColors.primary.withValues(alpha: 0.05);
    return AppColors.surface;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: _backgroundColor,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: isAnswered ? null : onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: BoxDecoration(
            border: Border.all(color: _borderColor, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              if (isCorrect)
                const Icon(Icons.check_circle, color: AppColors.success),
              if (isWrong) const Icon(Icons.cancel, color: AppColors.error),
            ],
          ),
        ),
      ),
    );
  }
}
