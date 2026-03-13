import 'package:flutter_base/features/quiz/domain/entities/question_type.dart';

class Question {
  const Question({
    required this.id,
    required this.level,
    required this.type,
    required this.title,
    required this.description,
    required this.options,
    required this.correctAnswerIndex,
    required this.explanation,
    this.codeSnippet,
    this.category = '',
  });

  final String id;
  final int level;
  final QuestionType type;
  final String title;
  final String description;
  final List<String> options;
  final int correctAnswerIndex;
  final String explanation;
  final String? codeSnippet;
  final String category;

  String get correctAnswer => options[correctAnswerIndex];
}
