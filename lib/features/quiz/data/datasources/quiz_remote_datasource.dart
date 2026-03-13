import 'package:flutter_base/core/network/api_client.dart';
import 'package:flutter_base/features/quiz/data/models/question_model.dart';

class QuizRemoteDatasource {
  const QuizRemoteDatasource(this._client);
  final ApiClient _client;

  Future<List<QuestionModel>> getQuestionsByLevel(int level) async {
    final response = await _client.get<List<dynamic>>(
      '/questions',
      queryParameters: {'level': level},
    );
    final data = response.data ?? [];
    return data
        .cast<Map<String, dynamic>>()
        .map(QuestionModel.fromJson)
        .toList();
  }

  Future<QuestionModel?> getQuestionById(String id) async {
    final response = await _client.get<Map<String, dynamic>>(
      '/questions/$id',
    );
    if (response.data == null) return null;
    return QuestionModel.fromJson(response.data!);
  }
}
