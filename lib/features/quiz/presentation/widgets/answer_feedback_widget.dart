import 'package:flutter/material.dart';
import 'package:flutter_base/app/theme/app_colors.dart';
import 'package:flutter_base/features/quiz/domain/usecases/submit_answer.dart';
import 'package:flutter_base/gen/i18n/strings.g.dart';

class AnswerFeedbackWidget extends StatelessWidget {
  const AnswerFeedbackWidget({
    required this.result,
    required this.onNext,
    super.key,
  });

  final AnswerResult result;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: result.isCorrect
            ? colors.success.withValues(alpha: 0.1)
            : colors.error.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: result.isCorrect ? colors.success : colors.error,
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(
                result.isCorrect ? Icons.check_circle : Icons.cancel,
                color: result.isCorrect ? colors.success : colors.error,
                size: 28,
              ),
              const SizedBox(width: 12),
              Text(
                result.isCorrect
                    ? context.t.quiz.correct
                    : context.t.quiz.incorrect,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: result.isCorrect ? colors.success : colors.error,
                ),
              ),
              if (result.isCorrect) ...[
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: colors.xpGold.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    context.t.common.xpEarned(count: result.xpEarned),
                    style: TextStyle(
                      color: colors.accentDark,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 12),
          Text(
            result.explanation,
            style: TextStyle(
              fontSize: 14,
              color: colors.textSecondary,
              height: 1.5,
            ),
          ),
          if (!result.isCorrect) ...[
            const SizedBox(height: 8),
            Text(
              context.t.quiz.correctAnswer(answer: result.correctAnswer),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: colors.success,
              ),
            ),
          ],
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onNext,
              child: Text(context.t.quiz.continue_),
            ),
          ),
        ],
      ),
    );
  }
}
