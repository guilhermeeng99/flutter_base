import 'package:flutter_base/features/progress/data/models/user_progress_model.dart';

/// Simple in-memory storage for web. Replace with SharedPreferences
/// or a proper persistence layer as needed.
class ProgressLocalDatasource {
  UserProgressModel? _cached;

  Future<UserProgressModel> getUserProgress() async {
    return _cached ?? const UserProgressModel();
  }

  Future<void> saveUserProgress(UserProgressModel model) async {
    _cached = model;
  }
}
