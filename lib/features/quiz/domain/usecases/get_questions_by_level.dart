import 'package:flutter_base/features/quiz/domain/entities/question.dart';
import 'package:flutter_base/features/quiz/domain/repositories/quiz_repository.dart';

class GetQuestionsByLevel {
  const GetQuestionsByLevel(this._repository);
  final QuizRepository _repository;

  Future<List<Question>> call(int level) {
    return _repository.getQuestionsByLevel(level);
  }
}
