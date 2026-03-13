import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_base/app/theme/app_colors.dart';
import 'package:flutter_base/features/quiz/domain/entities/question_type.dart';
import 'package:flutter_base/features/quiz/domain/entities/quiz_session.dart';
import 'package:flutter_base/features/quiz/presentation/controllers/quiz_controller.dart';
import 'package:flutter_base/features/quiz/presentation/widgets/answer_feedback_widget.dart';
import 'package:flutter_base/features/quiz/presentation/widgets/code_question_widget.dart';
import 'package:flutter_base/features/quiz/presentation/widgets/fill_blank_widget.dart';
import 'package:flutter_base/features/quiz/presentation/widgets/multiple_choice_widget.dart';
import 'package:flutter_base/features/quiz/presentation/widgets/question_card.dart';
import 'package:flutter_base/gen/i18n/strings.g.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({required this.level, super.key});
  final int level;

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late final QuizController _controller;

  @override
  void initState() {
    super.initState();
    _controller = Get.find<QuizController>();
    unawaited(_controller.loadQuestions(widget.level));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.go('/home'),
        ),
        title: Obx(
          () => LinearProgressIndicator(
            value: _controller.progress,
            backgroundColor: AppColors.border,
            valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
            minHeight: 10,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
      body: Obx(() {
        if (_controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (_controller.questions.isEmpty) {
          return Center(
            child: Text(context.t.quiz.noQuestions),
          );
        }

        final session = _controller.session.value;
        if (session != null && session.isCompleted) {
          return _QuizCompleteView(session: session, controller: _controller);
        }

        final question = _controller.currentQuestion;
        if (question == null) {
          return Center(child: Text(context.t.quiz.error));
        }

        return SingleChildScrollView(
          child: Column(
            children: [
              QuestionCard(
                title: question.title,
                description: question.description,
                questionNumber: _controller.currentIndex.value + 1,
                totalQuestions: _controller.questions.length,
              ),
              const SizedBox(height: 8),
              _buildQuestionTypeWidget(),
              const SizedBox(height: 16),
              if (!_controller.isAnswered.value)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    width: double.infinity,
                    child: Obx(
                      () => ElevatedButton(
                        onPressed: _controller.selectedAnswer.value != null
                            ? _controller.confirmAnswer
                            : null,
                        child: Text(context.t.quiz.checkAnswer),
                      ),
                    ),
                  ),
                ),
              if (_controller.isAnswered.value &&
                  _controller.answerResult.value != null)
                AnswerFeedbackWidget(
                  result: _controller.answerResult.value!,
                  onNext: _controller.nextQuestion,
                ),
              const SizedBox(height: 32),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildQuestionTypeWidget() {
    return Obx(() {
      final q = _controller.currentQuestion!;
      switch (q.type) {
        case QuestionType.fillInTheBlank:
          return FillBlankWidget(
            options: q.options,
            selectedIndex: _controller.selectedAnswer.value,
            correctAnswerIndex: _controller.isAnswered.value
                ? q.correctAnswerIndex
                : null,
            isAnswered: _controller.isAnswered.value,
            onSelected: _controller.selectAnswer,
          );
        case QuestionType.codeBased:
          return CodeQuestionWidget(
            codeSnippet: q.codeSnippet ?? '',
            options: q.options,
            selectedIndex: _controller.selectedAnswer.value,
            correctAnswerIndex: _controller.isAnswered.value
                ? q.correctAnswerIndex
                : null,
            isAnswered: _controller.isAnswered.value,
            onSelected: _controller.selectAnswer,
          );
        case QuestionType.multipleChoice:
          return MultipleChoiceWidget(
            options: q.options,
            selectedIndex: _controller.selectedAnswer.value,
            correctAnswerIndex: _controller.isAnswered.value
                ? q.correctAnswerIndex
                : null,
            isAnswered: _controller.isAnswered.value,
            onSelected: _controller.selectAnswer,
          );
      }
    });
  }
}

class _QuizCompleteView extends StatelessWidget {
  const _QuizCompleteView({
    required this.session,
    required this.controller,
  });

  final QuizSession session;
  final QuizController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.emoji_events, size: 80, color: AppColors.xpGold),
            const SizedBox(height: 24),
            Text(
              context.t.quiz.levelComplete,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              context.t.quiz.correctCount(
                correct: session.correctAnswers,
                total: session.totalQuestions,
              ),
              style: const TextStyle(
                fontSize: 20,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.xpGold.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                context.t.common.xpEarned(count: session.xpEarned),
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: AppColors.accentDark,
                ),
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => context.go('/home'),
                child: Text(context.t.quiz.backToHome),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
