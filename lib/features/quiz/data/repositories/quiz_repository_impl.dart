import 'package:flutter_base/features/quiz/data/datasources/quiz_local_datasource.dart';
import 'package:flutter_base/features/quiz/data/models/question_model.dart';
import 'package:flutter_base/features/quiz/domain/entities/question.dart';
import 'package:flutter_base/features/quiz/domain/repositories/quiz_repository.dart';

class QuizRepositoryImpl implements QuizRepository {
  const QuizRepositoryImpl(this._localDatasource);
  final QuizLocalDatasource _localDatasource;

  @override
  Future<List<Question>> getQuestionsByLevel(int level) async {
    final models = _localDatasource.getQuestionsByLevel(level);
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<Question?> getQuestionById(String id) async {
    final model = _localDatasource.getQuestionById(id);
    return model?.toEntity();
  }

  @override
  Future<List<Question>> getAllQuestions() async {
    final models = _localDatasource.getAllQuestions();
    return models.map((m) => m.toEntity()).toList();
  }
}
