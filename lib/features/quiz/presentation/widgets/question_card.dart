import 'package:flutter/material.dart';
import 'package:flutter_base/app/theme/app_colors.dart';
import 'package:flutter_base/gen/i18n/strings.g.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    required this.title,
    required this.description,
    this.questionNumber,
    this.totalQuestions,
    super.key,
  });

  final String title;
  final String description;
  final int? questionNumber;
  final int? totalQuestions;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (questionNumber != null && totalQuestions != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  context.t.quiz.questionOf(
                    current: questionNumber!,
                    total: totalQuestions!,
                  ),
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              description,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.textSecondary,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
