import 'package:flutter_base/features/quiz/domain/entities/question.dart';

abstract class QuizRepository {
  Future<List<Question>> getQuestionsByLevel(int level);
  Future<Question?> getQuestionById(String id);
  Future<List<Question>> getAllQuestions();
}
