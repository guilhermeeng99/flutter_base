import 'package:flutter_base/features/progress/data/datasources/progress_local_datasource.dart';
import 'package:flutter_base/features/progress/data/models/user_progress_model.dart';
import 'package:flutter_base/features/progress/domain/entities/user_progress.dart';
import 'package:flutter_base/features/progress/domain/repositories/progress_repository.dart';

class ProgressRepositoryImpl implements ProgressRepository {
  ProgressRepositoryImpl(this._localDatasource);
  final ProgressLocalDatasource _localDatasource;

  @override
  Future<UserProgress> getUserProgress() async {
    final model = await _localDatasource.getUserProgress();
    return model.toEntity();
  }

  @override
  Future<void> saveUserProgress(UserProgress progress) async {
    await _localDatasource.saveUserProgress(progress.toModel());
  }

  @override
  Future<void> addXp(int amount) async {
    final current = await _localDatasource.getUserProgress();
    final updated = current.copyWith(totalXp: current.totalXp + amount);
    await _localDatasource.saveUserProgress(updated);
  }

  @override
  Future<void> updateStreak() async {
    final current = await _localDatasource.getUserProgress();
    final now = DateTime.now();
    final lastActive = current.lastActiveDate != null
        ? DateTime.tryParse(current.lastActiveDate!)
        : null;

    var newStreak = current.currentStreak;

    if (lastActive == null) {
      newStreak = 1;
    } else {
      final difference = now.difference(lastActive).inDays;
      if (difference == 1) {
        newStreak = current.currentStreak + 1;
      } else if (difference > 1) {
        newStreak = 1;
      }
    }

    final longestStreak = newStreak > current.longestStreak
        ? newStreak
        : current.longestStreak;

    await _localDatasource.saveUserProgress(
      current.copyWith(
        currentStreak: newStreak,
        longestStreak: longestStreak,
        lastActiveDate: now.toIso8601String(),
      ),
    );
  }

  @override
  Future<void> markLevelCompleted(int level) async {
    final current = await _localDatasource.getUserProgress();
    if (!current.completedLevels.contains(level)) {
      final updated = current.copyWith(
        completedLevels: [...current.completedLevels, level],
      );
      await _localDatasource.saveUserProgress(updated);
    }
  }
}
