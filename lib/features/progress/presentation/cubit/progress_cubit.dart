import 'package:flutter_base/features/progress/data/datasources/progress_local_datasource.dart';
import 'package:flutter_base/features/progress/data/repositories/progress_repository_impl.dart';
import 'package:flutter_base/features/progress/domain/entities/user_progress.dart';
import 'package:flutter_base/features/progress/domain/usecases/get_user_progress.dart';
import 'package:flutter_base/features/progress/domain/usecases/update_streak.dart';
import 'package:flutter_base/features/progress/domain/usecases/update_xp.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'progress_state.dart';

class ProgressCubit extends Cubit<ProgressState> {
  ProgressCubit({
    required GetUserProgress getUserProgress,
    required UpdateXp updateXp,
    required UpdateStreak updateStreak,
  }) : _getUserProgress = getUserProgress,
       _updateXp = updateXp,
       _updateStreak = updateStreak,
       super(ProgressInitial());

  factory ProgressCubit.create() {
    final datasource = ProgressLocalDatasource();
    final repository = ProgressRepositoryImpl(datasource);
    return ProgressCubit(
      getUserProgress: GetUserProgress(repository),
      updateXp: UpdateXp(repository),
      updateStreak: UpdateStreak(repository),
    );
  }

  final GetUserProgress _getUserProgress;
  final UpdateXp _updateXp;
  final UpdateStreak _updateStreak;

  Future<void> loadProgress() async {
    emit(ProgressLoading());
    try {
      await _updateStreak();
      final progress = await _getUserProgress();
      emit(ProgressLoaded(progress));
    } on Exception catch (e) {
      emit(ProgressError(e.toString()));
    }
  }

  Future<void> addXp(int amount) async {
    await _updateXp(amount);
    final progress = await _getUserProgress();
    emit(ProgressLoaded(progress));
  }

  Future<void> refresh() async {
    emit(ProgressLoading());
    try {
      final progress = await _getUserProgress();
      emit(ProgressLoaded(progress));
    } on Exception catch (e) {
      emit(ProgressError(e.toString()));
    }
  }
}
