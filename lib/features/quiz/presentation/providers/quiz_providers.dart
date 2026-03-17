import 'package:flutter_base/features/quiz/data/datasources/quiz_local_datasource.dart';
import 'package:flutter_base/features/quiz/data/repositories/quiz_repository_impl.dart';
import 'package:flutter_base/features/quiz/domain/repositories/quiz_repository.dart';
import 'package:flutter_base/features/quiz/domain/usecases/get_questions_by_level.dart';
import 'package:flutter_base/features/quiz/domain/usecases/submit_answer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ── DataSource ──
final quizLocalDatasourceProvider = Provider<QuizLocalDatasource>(
  (ref) => QuizLocalDatasource(),
);

// ── Repository ──
final quizRepositoryProvider = Provider<QuizRepository>(
  (ref) => QuizRepositoryImpl(ref.read(quizLocalDatasourceProvider)),
);

// ── UseCases ──
final getQuestionsByLevelProvider = Provider<GetQuestionsByLevel>(
  (ref) => GetQuestionsByLevel(ref.read(quizRepositoryProvider)),
);

final submitAnswerProvider = Provider<SubmitAnswer>(
  (ref) => const SubmitAnswer(),
);
