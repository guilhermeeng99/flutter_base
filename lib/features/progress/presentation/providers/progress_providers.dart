import 'package:flutter_base/features/progress/data/datasources/progress_local_datasource.dart';
import 'package:flutter_base/features/progress/data/repositories/progress_repository_impl.dart';
import 'package:flutter_base/features/progress/domain/entities/user_progress.dart';
import 'package:flutter_base/features/progress/domain/repositories/progress_repository.dart';
import 'package:flutter_base/features/progress/domain/usecases/get_user_progress.dart';
import 'package:flutter_base/features/progress/domain/usecases/update_streak.dart';
import 'package:flutter_base/features/progress/domain/usecases/update_xp.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ── DataSource ──
final progressLocalDatasourceProvider = Provider<ProgressLocalDatasource>(
  (ref) => ProgressLocalDatasource(),
);

// ── Repository ──
final progressRepositoryProvider = Provider<ProgressRepository>(
  (ref) => ProgressRepositoryImpl(ref.read(progressLocalDatasourceProvider)),
);

// ── UseCases ──
final getUserProgressProvider = Provider<GetUserProgress>(
  (ref) => GetUserProgress(ref.read(progressRepositoryProvider)),
);

final updateXpProvider = Provider<UpdateXp>(
  (ref) => UpdateXp(ref.read(progressRepositoryProvider)),
);

final updateStreakProvider = Provider<UpdateStreak>(
  (ref) => UpdateStreak(ref.read(progressRepositoryProvider)),
);

// ── Notifier ──
final progressProvider = AsyncNotifierProvider<ProgressNotifier, UserProgress>(
  ProgressNotifier.new,
);

class ProgressNotifier extends AsyncNotifier<UserProgress> {
  late final GetUserProgress _getUserProgress;
  late final UpdateXp _updateXp;
  late final UpdateStreak _updateStreak;

  @override
  Future<UserProgress> build() async {
    _getUserProgress = ref.read(getUserProgressProvider);
    _updateXp = ref.read(updateXpProvider);
    _updateStreak = ref.read(updateStreakProvider);

    await _updateStreak();
    return _getUserProgress();
  }

  Future<void> addXp(int amount) async {
    await _updateXp(amount);
    state = AsyncData(await _getUserProgress());
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = AsyncData(await _getUserProgress());
  }
}
