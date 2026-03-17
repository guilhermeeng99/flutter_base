// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuestionModel _$QuestionModelFromJson(Map<String, dynamic> json) =>
    _QuestionModel(
      id: json['id'] as String,
      level: (json['level'] as num).toInt(),
      type: $enumDecode(_$QuestionTypeEnumMap, json['type']),
      title: json['title'] as String,
      description: json['description'] as String,
      options: (json['options'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      correctAnswerIndex: (json['correctAnswerIndex'] as num).toInt(),
      explanation: json['explanation'] as String,
      codeSnippet: json['codeSnippet'] as String?,
      category:
          $enumDecodeNullable(_$QuestionCategoryEnumMap, json['category']) ??
          QuestionCategory.general,
    );

Map<String, dynamic> _$QuestionModelToJson(_QuestionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'level': instance.level,
      'type': _$QuestionTypeEnumMap[instance.type]!,
      'title': instance.title,
      'description': instance.description,
      'options': instance.options,
      'correctAnswerIndex': instance.correctAnswerIndex,
      'explanation': instance.explanation,
      'codeSnippet': instance.codeSnippet,
      'category': _$QuestionCategoryEnumMap[instance.category]!,
    };

const _$QuestionTypeEnumMap = {
  QuestionType.multipleChoice: 'multiple_choice',
  QuestionType.fillInTheBlank: 'fill_in_the_blank',
  QuestionType.codeBased: 'code_based',
};

const _$QuestionCategoryEnumMap = {
  QuestionCategory.general: 'general',
  QuestionCategory.widgets: 'widgets',
  QuestionCategory.basics: 'basics',
  QuestionCategory.layout: 'layout',
  QuestionCategory.stateManagement: 'state_management',
  QuestionCategory.navigation: 'navigation',
  QuestionCategory.architecture: 'architecture',
  QuestionCategory.performance: 'performance',
};
