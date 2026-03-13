import 'package:flutter_base/features/progress/domain/repositories/progress_repository.dart';

class UpdateStreak {
  const UpdateStreak(this._repository);
  final ProgressRepository _repository;

  Future<void> call() {
    return _repository.updateStreak();
  }
}
