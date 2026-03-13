import 'package:flutter_base/features/progress/domain/entities/user_progress.dart';

abstract class ProgressRepository {
  Future<UserProgress> getUserProgress();
  Future<void> saveUserProgress(UserProgress progress);
  Future<void> addXp(int amount);
  Future<void> updateStreak();
  Future<void> markLevelCompleted(int level);
}
