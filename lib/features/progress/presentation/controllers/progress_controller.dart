import 'dart:async';

import 'package:flutter_base/features/progress/domain/entities/user_progress.dart';
import 'package:flutter_base/features/progress/domain/usecases/get_user_progress.dart';
import 'package:flutter_base/features/progress/domain/usecases/update_streak.dart';
import 'package:flutter_base/features/progress/domain/usecases/update_xp.dart';
import 'package:get/get.dart';

class ProgressController extends GetxController {
  ProgressController({
    required GetUserProgress getUserProgress,
    required UpdateXp updateXp,
    required UpdateStreak updateStreak,
  }) : _getUserProgress = getUserProgress,
       _updateXp = updateXp,
       _updateStreak = updateStreak;

  final GetUserProgress _getUserProgress;
  final UpdateXp _updateXp;
  final UpdateStreak _updateStreak;

  final Rx<UserProgress> progress = const UserProgress().obs;
  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    unawaited(loadProgress());
  }

  Future<void> loadProgress() async {
    isLoading.value = true;
    try {
      progress.value = await _getUserProgress();
      await _updateStreak();
      progress.value = await _getUserProgress();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addXp(int amount) async {
    await _updateXp(amount);
    progress.value = await _getUserProgress();
  }
}
