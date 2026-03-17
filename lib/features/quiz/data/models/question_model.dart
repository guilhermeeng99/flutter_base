import 'package:flutter_base/features/quiz/domain/entities/question.dart';
import 'package:flutter_base/features/quiz/domain/entities/question_category.dart';
import 'package:flutter_base/features/quiz/domain/entities/question_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_model.freezed.dart';
part 'question_model.g.dart';

@freezed
abstract class QuestionModel with _$QuestionModel {
  const factory QuestionModel({
    required String id,
    required int level,
    required QuestionType type,
    required String title,
    required String description,
    required List<String> options,
    required int correctAnswerIndex,
    required String explanation,
    String? codeSnippet,
    @Default(QuestionCategory.general) QuestionCategory category,
  }) = _QuestionModel;

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);
}

extension QuestionModelMapper on QuestionModel {
  Question toEntity() {
    return Question(
      id: id,
      level: level,
      type: type,
      title: title,
      description: description,
      options: options,
      correctAnswerIndex: correctAnswerIndex,
      explanation: explanation,
      codeSnippet: codeSnippet,
      category: category,
    );
  }
}

extension QuestionToModel on Question {
  QuestionModel toModel() {
    return QuestionModel(
      id: id,
      level: level,
      type: type,
      title: title,
      description: description,
      options: options,
      correctAnswerIndex: correctAnswerIndex,
      explanation: explanation,
      codeSnippet: codeSnippet,
      category: category,
    );
  }
}
