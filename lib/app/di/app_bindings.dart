import 'package:flutter_base/core/network/api_client.dart';
import 'package:flutter_base/features/home/presentation/controllers/home_controller.dart';
import 'package:flutter_base/features/progress/data/datasources/progress_local_datasource.dart';
import 'package:flutter_base/features/progress/data/repositories/progress_repository_impl.dart';
import 'package:flutter_base/features/progress/domain/repositories/progress_repository.dart';
import 'package:flutter_base/features/progress/domain/usecases/get_user_progress.dart';
import 'package:flutter_base/features/progress/domain/usecases/update_streak.dart';
import 'package:flutter_base/features/progress/domain/usecases/update_xp.dart';
import 'package:flutter_base/features/progress/presentation/controllers/progress_controller.dart';
import 'package:flutter_base/features/quiz/data/datasources/quiz_local_datasource.dart';
import 'package:flutter_base/features/quiz/data/repositories/quiz_repository_impl.dart';
import 'package:flutter_base/features/quiz/domain/repositories/quiz_repository.dart';
import 'package:flutter_base/features/quiz/domain/usecases/get_questions_by_level.dart';
import 'package:flutter_base/features/quiz/domain/usecases/submit_answer.dart';
import 'package:flutter_base/features/quiz/presentation/controllers/quiz_controller.dart';
import 'package:get/get.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    // ── Core ──
    Get
      ..lazyPut<ApiClient>(ApiClient.new, fenix: true)
      // ── Quiz Feature ──
      ..lazyPut<QuizLocalDatasource>(QuizLocalDatasource.new, fenix: true)
      ..lazyPut<QuizRepository>(
        () => QuizRepositoryImpl(Get.find()),
        fenix: true,
      )
      ..lazyPut(() => GetQuestionsByLevel(Get.find()), fenix: true)
      ..lazyPut(() => const SubmitAnswer(), fenix: true)
      ..lazyPut(
        () => QuizController(
          getQuestionsByLevel: Get.find(),
          submitAnswer: Get.find(),
        ),
        fenix: true,
      )
      // ── Progress Feature ──
      ..lazyPut<ProgressLocalDatasource>(
        ProgressLocalDatasource.new,
        fenix: true,
      )
      ..lazyPut<ProgressRepository>(
        () => ProgressRepositoryImpl(Get.find()),
        fenix: true,
      )
      ..lazyPut(() => GetUserProgress(Get.find()), fenix: true)
      ..lazyPut(() => UpdateXp(Get.find()), fenix: true)
      ..lazyPut(() => UpdateStreak(Get.find()), fenix: true)
      ..put(
        ProgressController(
          getUserProgress: Get.find(),
          updateXp: Get.find(),
          updateStreak: Get.find(),
        ),
        permanent: true,
      )
      // ── Home Feature ──
      ..lazyPut(HomeController.new, fenix: true);
  }
}
