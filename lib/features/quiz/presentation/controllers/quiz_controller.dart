import 'dart:async';

import 'package:flutter_base/features/progress/presentation/controllers/progress_controller.dart';
import 'package:flutter_base/features/quiz/domain/entities/question.dart';
import 'package:flutter_base/features/quiz/domain/entities/quiz_session.dart';
import 'package:flutter_base/features/quiz/domain/usecases/get_questions_by_level.dart';
import 'package:flutter_base/features/quiz/domain/usecases/submit_answer.dart';
import 'package:get/get.dart';

class QuizController extends GetxController {
  QuizController({
    required GetQuestionsByLevel getQuestionsByLevel,
    required SubmitAnswer submitAnswer,
  }) : _getQuestionsByLevel = getQuestionsByLevel,
       _submitAnswer = submitAnswer;

  final GetQuestionsByLevel _getQuestionsByLevel;
  final SubmitAnswer _submitAnswer;

  final RxList<Question> questions = <Question>[].obs;
  final RxInt currentIndex = 0.obs;
  final selectedAnswer = Rxn<int>();
  final answerResult = Rxn<AnswerResult>();
  final RxBool isLoading = true.obs;
  final RxBool isAnswered = false.obs;
  final session = Rxn<QuizSession>();

  Question? get currentQuestion =>
      questions.isNotEmpty && currentIndex.value < questions.length
      ? questions[currentIndex.value]
      : null;

  bool get isLastQuestion => currentIndex.value >= questions.length - 1;

  double get progress =>
      questions.isNotEmpty ? (currentIndex.value + 1) / questions.length : 0;

  Future<void> loadQuestions(int level) async {
    isLoading.value = true;
    try {
      final result = await _getQuestionsByLevel(level);
      questions.assignAll(result);
      session.value = QuizSession(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        level: level,
        totalQuestions: result.length,
        startedAt: DateTime.now(),
      );
    } finally {
      isLoading.value = false;
    }
  }

  void selectAnswer(int index) {
    if (isAnswered.value) return;
    selectedAnswer.value = index;
  }

  void confirmAnswer() {
    if (selectedAnswer.value == null || isAnswered.value) return;

    final question = currentQuestion;
    if (question == null) return;

    final result = _submitAnswer(
      question: question,
      selectedIndex: selectedAnswer.value!,
    );

    answerResult.value = result;
    isAnswered.value = true;

    _updateSession(result);

    if (result.xpEarned > 0) {
      _addXp(result.xpEarned);
    }
  }

  void nextQuestion() {
    if (isLastQuestion) {
      _completeSession();
      return;
    }

    currentIndex.value++;
    selectedAnswer.value = null;
    answerResult.value = null;
    isAnswered.value = false;
  }

  void _updateSession(AnswerResult result) {
    final current = session.value;
    if (current == null) return;

    session.value = current.copyWith(
      correctAnswers: current.correctAnswers + (result.isCorrect ? 1 : 0),
      wrongAnswers: current.wrongAnswers + (result.isCorrect ? 0 : 1),
      xpEarned: current.xpEarned + result.xpEarned,
    );
  }

  void _completeSession() {
    final current = session.value;
    if (current == null) return;

    session.value = current.copyWith(
      isCompleted: true,
      completedAt: DateTime.now(),
    );
  }

  void _addXp(int amount) {
    if (Get.isRegistered<ProgressController>()) {
      unawaited(Get.find<ProgressController>().addXp(amount));
    }
  }

  void reset() {
    currentIndex.value = 0;
    selectedAnswer.value = null;
    answerResult.value = null;
    isAnswered.value = false;
    questions.clear();
    session.value = null;
  }
}
