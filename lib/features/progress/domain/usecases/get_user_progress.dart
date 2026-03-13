import 'package:flutter_base/features/progress/domain/entities/user_progress.dart';
import 'package:flutter_base/features/progress/domain/repositories/progress_repository.dart';

class GetUserProgress {
  const GetUserProgress(this._repository);
  final ProgressRepository _repository;

  Future<UserProgress> call() {
    return _repository.getUserProgress();
  }
}
