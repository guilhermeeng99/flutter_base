import 'package:flutter_base/features/progress/domain/entities/user_progress.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_progress_model.freezed.dart';
part 'user_progress_model.g.dart';

@freezed
abstract class UserProgressModel with _$UserProgressModel {
  const factory UserProgressModel({
    @Default(0) int totalXp,
    @Default(1) int currentLevel,
    @Default(0) int currentStreak,
    @Default(0) int longestStreak,
    @Default(0) int questionsAnswered,
    @Default(0) int correctAnswers,
    @Default([]) List<int> completedLevels,
    String? lastActiveDate,
  }) = _UserProgressModel;

  factory UserProgressModel.fromJson(Map<String, dynamic> json) =>
      _$UserProgressModelFromJson(json);
}

extension UserProgressModelMapper on UserProgressModel {
  UserProgress toEntity() {
    return UserProgress(
      totalXp: totalXp,
      currentLevel: currentLevel,
      currentStreak: currentStreak,
      longestStreak: longestStreak,
      questionsAnswered: questionsAnswered,
      correctAnswers: correctAnswers,
      completedLevels: completedLevels,
      lastActiveDate: lastActiveDate != null
          ? DateTime.tryParse(lastActiveDate!)
          : null,
    );
  }
}

extension UserProgressToModel on UserProgress {
  UserProgressModel toModel() {
    return UserProgressModel(
      totalXp: totalXp,
      currentLevel: currentLevel,
      currentStreak: currentStreak,
      longestStreak: longestStreak,
      questionsAnswered: questionsAnswered,
      correctAnswers: correctAnswers,
      completedLevels: completedLevels,
      lastActiveDate: lastActiveDate?.toIso8601String(),
    );
  }
}
