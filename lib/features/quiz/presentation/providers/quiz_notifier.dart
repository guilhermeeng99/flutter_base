import 'dart:async';

import 'package:flutter_base/features/progress/presentation/providers/progress_providers.dart';
import 'package:flutter_base/features/quiz/domain/entities/question.dart';
import 'package:flutter_base/features/quiz/domain/entities/quiz_session.dart';
import 'package:flutter_base/features/quiz/domain/usecases/get_questions_by_level.dart';
import 'package:flutter_base/features/quiz/domain/usecases/submit_answer.dart';
import 'package:flutter_base/features/quiz/presentation/providers/quiz_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final quizNotifierProvider = NotifierProvider<QuizNotifier, QuizState>(
  QuizNotifier.new,
);

class QuizState {
  const QuizState({
    this.questions = const [],
    this.currentIndex = 0,
    this.selectedAnswer,
    this.answerResult,
    this.isLoading = true,
    this.isAnswered = false,
    this.session,
  });

  final List<Question> questions;
  final int currentIndex;
  final int? selectedAnswer;
  final AnswerResult? answerResult;
  final bool isLoading;
  final bool isAnswered;
  final QuizSession? session;

  Question? get currentQuestion =>
      questions.isNotEmpty && currentIndex < questions.length
      ? questions[currentIndex]
      : null;

  bool get isLastQuestion => currentIndex >= questions.length - 1;

  double get progress =>
      questions.isNotEmpty ? (currentIndex + 1) / questions.length : 0;

  QuizState copyWith({
    List<Question>? questions,
    int? currentIndex,
    int? Function()? selectedAnswer,
    AnswerResult? Function()? answerResult,
    bool? isLoading,
    bool? isAnswered,
    QuizSession? Function()? session,
  }) {
    return QuizState(
      questions: questions ?? this.questions,
      currentIndex: currentIndex ?? this.currentIndex,
      selectedAnswer: selectedAnswer != null
          ? selectedAnswer()
          : this.selectedAnswer,
      answerResult: answerResult != null ? answerResult() : this.answerResult,
      isLoading: isLoading ?? this.isLoading,
      isAnswered: isAnswered ?? this.isAnswered,
      session: session != null ? session() : this.session,
    );
  }
}

class QuizNotifier extends Notifier<QuizState> {
  late final GetQuestionsByLevel _getQuestionsByLevel;
  late final SubmitAnswer _submitAnswer;

  @override
  QuizState build() {
    _getQuestionsByLevel = ref.read(getQuestionsByLevelProvider);
    _submitAnswer = ref.read(submitAnswerProvider);
    return const QuizState();
  }

  Future<void> loadQuestions(int level) async {
    state = state.copyWith(isLoading: true);
    final result = await _getQuestionsByLevel(level);
    state = state.copyWith(
      questions: result,
      isLoading: false,
      session: () => QuizSession(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        level: level,
        totalQuestions: result.length,
        startedAt: DateTime.now(),
      ),
    );
  }

  void selectAnswer(int index) {
    if (state.isAnswered) return;
    state = state.copyWith(selectedAnswer: () => index);
  }

  void confirmAnswer() {
    if (state.selectedAnswer == null || state.isAnswered) return;

    final question = state.currentQuestion;
    if (question == null) return;

    final result = _submitAnswer(
      question: question,
      selectedIndex: state.selectedAnswer!,
    );

    state = state.copyWith(
      answerResult: () => result,
      isAnswered: true,
      session: () => _updatedSession(result),
    );

    if (result.xpEarned > 0) {
      unawaited(ref.read(progressProvider.notifier).addXp(result.xpEarned));
    }
  }

  void nextQuestion() {
    if (state.isLastQuestion) {
      _completeSession();
      return;
    }

    state = state.copyWith(
      currentIndex: state.currentIndex + 1,
      selectedAnswer: () => null,
      answerResult: () => null,
      isAnswered: false,
    );
  }

  void reset() {
    state = const QuizState();
  }

  QuizSession? _updatedSession(AnswerResult result) {
    final current = state.session;
    if (current == null) return null;
    return current.copyWith(
      correctAnswers: current.correctAnswers + (result.isCorrect ? 1 : 0),
      wrongAnswers: current.wrongAnswers + (result.isCorrect ? 0 : 1),
      xpEarned: current.xpEarned + result.xpEarned,
    );
  }

  void _completeSession() {
    final current = state.session;
    if (current == null) return;
    state = state.copyWith(
      session: () => current.copyWith(
        isCompleted: true,
        completedAt: DateTime.now(),
      ),
    );
  }
}
