import 'package:flutter/material.dart';
import 'package:flutter_base/features/home/presentation/pages/home_page.dart';
import 'package:flutter_base/features/landing/presentation/pages/landing_page.dart';
import 'package:flutter_base/features/progress/presentation/pages/progress_page.dart';
import 'package:flutter_base/features/quiz/presentation/cubit/quiz_cubit.dart';
import 'package:flutter_base/features/quiz/presentation/pages/quiz_page.dart';
import 'package:flutter_base/gen/i18n/strings.g.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoutes {
  static const String landing = '/';
  static const String home = '/home';
  static const String quiz = '/quiz/:level';
  static const String progress = '/progress';

  static String quizByLevel(int level) => '/quiz/$level';
}


final appRouter = GoRouter(
  initialLocation: AppRoutes.landing,
  routes: [
    GoRoute(
      path: AppRoutes.landing,
      builder: (context, state) => const LandingPage(),
    ),
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: AppRoutes.quiz,
      builder: (context, state) {
        final level = int.tryParse(state.pathParameters['level'] ?? '1') ?? 1;
        return BlocProvider(
          create: (_) => QuizCubit.create(),
          child: QuizPage(level: level),
        );
      },
    ),
    GoRoute(
      path: AppRoutes.progress,
      builder: (context, state) => const ProgressPage(),
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text(context.t.common.pageNotFound),
    ),
  ),
);
