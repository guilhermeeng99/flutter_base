import 'package:flutter_base/features/progress/domain/repositories/progress_repository.dart';

class UpdateXp {
  const UpdateXp(this._repository);
  final ProgressRepository _repository;

  Future<void> call(int amount) {
    return _repository.addXp(amount);
  }
}
