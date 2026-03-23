part of 'progress_cubit.dart';

sealed class ProgressState {}

final class ProgressInitial extends ProgressState {}

final class ProgressLoading extends ProgressState {}

final class ProgressLoaded extends ProgressState {
  ProgressLoaded(this.progress);
  final UserProgress progress;
}

final class ProgressError extends ProgressState {
  ProgressError(this.message);
  final String message;
}
