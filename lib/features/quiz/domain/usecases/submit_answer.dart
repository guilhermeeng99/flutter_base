import 'package:flutter_base/core/constants/app_constants.dart';
import 'package:flutter_base/features/quiz/domain/entities/question.dart';

class SubmitAnswer {
  const SubmitAnswer();

  AnswerResult call({
    required Question question,
    required int selectedIndex,
  }) {
    final isCorrect = selectedIndex == question.correctAnswerIndex;
    return AnswerResult(
      isCorrect: isCorrect,
      correctAnswer: question.correctAnswer,
      explanation: question.explanation,
      xpEarned: isCorrect ? AppConstants.xpPerCorrectAnswer : 0,
    );
  }
}

class AnswerResult {
  const AnswerResult({
    required this.isCorrect,
    required this.correctAnswer,
    required this.explanation,
    required this.xpEarned,
  });

  final bool isCorrect;
  final String correctAnswer;
  final String explanation;
  final int xpEarned;
}
