// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_progress_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserProgressModel _$UserProgressModelFromJson(Map<String, dynamic> json) =>
    _UserProgressModel(
      totalXp: (json['totalXp'] as num?)?.toInt() ?? 0,
      currentLevel: (json['currentLevel'] as num?)?.toInt() ?? 1,
      currentStreak: (json['currentStreak'] as num?)?.toInt() ?? 0,
      longestStreak: (json['longestStreak'] as num?)?.toInt() ?? 0,
      questionsAnswered: (json['questionsAnswered'] as num?)?.toInt() ?? 0,
      correctAnswers: (json['correctAnswers'] as num?)?.toInt() ?? 0,
      completedLevels:
          (json['completedLevels'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      lastActiveDate: json['lastActiveDate'] as String?,
    );

Map<String, dynamic> _$UserProgressModelToJson(_UserProgressModel instance) =>
    <String, dynamic>{
      'totalXp': instance.totalXp,
      'currentLevel': instance.currentLevel,
      'currentStreak': instance.currentStreak,
      'longestStreak': instance.longestStreak,
      'questionsAnswered': instance.questionsAnswered,
      'correctAnswers': instance.correctAnswers,
      'completedLevels': instance.completedLevels,
      'lastActiveDate': instance.lastActiveDate,
    };
