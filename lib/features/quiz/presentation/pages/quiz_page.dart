import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_base/app/routes/app_routes.dart';
import 'package:flutter_base/app/theme/app_colors.dart';
import 'package:flutter_base/features/quiz/domain/entities/question_type.dart';
import 'package:flutter_base/features/quiz/domain/entities/quiz_session.dart';
import 'package:flutter_base/features/quiz/presentation/providers/quiz_notifier.dart';
import 'package:flutter_base/features/quiz/presentation/widgets/answer_feedback_widget.dart';
import 'package:flutter_base/features/quiz/presentation/widgets/code_question_widget.dart';
import 'package:flutter_base/features/quiz/presentation/widgets/fill_blank_widget.dart';
import 'package:flutter_base/features/quiz/presentation/widgets/multiple_choice_widget.dart';
import 'package:flutter_base/features/quiz/presentation/widgets/question_card.dart';
import 'package:flutter_base/gen/i18n/strings.g.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class QuizPage extends ConsumerStatefulWidget {
  const QuizPage({required this.level, super.key});
  final int level;

  @override
  ConsumerState<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends ConsumerState<QuizPage> {
  void _closeQuiz(BuildContext context) {
    if (context.canPop()) {
      context.pop();
      return;
    }
    context.go(AppRoutes.home);
  }

  @override
  void initState() {
    super.initState();
    unawaited(
      Future.microtask(
        () =>
            ref.read(quizNotifierProvider.notifier).loadQuestions(widget.level),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(quizNotifierProvider);
    final notifier = ref.read(quizNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => _closeQuiz(context),
        ),
        title: LinearProgressIndicator(
          value: state.progress,
          backgroundColor: AppColors.border,
          valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
          minHeight: 10,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      body: _buildBody(context, state, notifier),
    );
  }

  Widget _buildBody(
    BuildContext context,
    QuizState state,
    QuizNotifier notifier,
  ) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.questions.isEmpty) {
      return Center(child: Text(context.t.quiz.noQuestions));
    }

    final session = state.session;
    if (session != null && session.isCompleted) {
      return _QuizCompleteView(session: session, notifier: notifier);
    }

    final question = state.currentQuestion;
    if (question == null) {
      return Center(child: Text(context.t.quiz.error));
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          QuestionCard(
            title: question.title,
            description: question.description,
            questionNumber: state.currentIndex + 1,
            totalQuestions: state.questions.length,
          ),
          const SizedBox(height: 8),
          _buildQuestionTypeWidget(state, notifier),
          const SizedBox(height: 16),
          if (!state.isAnswered)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: state.selectedAnswer != null
                      ? notifier.confirmAnswer
                      : null,
                  child: Text(context.t.quiz.checkAnswer),
                ),
              ),
            ),
          if (state.isAnswered && state.answerResult != null)
            AnswerFeedbackWidget(
              result: state.answerResult!,
              onNext: notifier.nextQuestion,
            ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildQuestionTypeWidget(QuizState state, QuizNotifier notifier) {
    final q = state.currentQuestion!;
    switch (q.type) {
      case QuestionType.fillInTheBlank:
        return FillBlankWidget(
          options: q.options,
          selectedIndex: state.selectedAnswer,
          correctAnswerIndex: state.isAnswered ? q.correctAnswerIndex : null,
          isAnswered: state.isAnswered,
          onSelected: notifier.selectAnswer,
        );
      case QuestionType.codeBased:
        return CodeQuestionWidget(
          codeSnippet: q.codeSnippet ?? '',
          options: q.options,
          selectedIndex: state.selectedAnswer,
          correctAnswerIndex: state.isAnswered ? q.correctAnswerIndex : null,
          isAnswered: state.isAnswered,
          onSelected: notifier.selectAnswer,
        );
      case QuestionType.multipleChoice:
        return MultipleChoiceWidget(
          options: q.options,
          selectedIndex: state.selectedAnswer,
          correctAnswerIndex: state.isAnswered ? q.correctAnswerIndex : null,
          isAnswered: state.isAnswered,
          onSelected: notifier.selectAnswer,
        );
    }
  }
}

class _QuizCompleteView extends StatelessWidget {
  const _QuizCompleteView({
    required this.session,
    required this.notifier,
  });

  final QuizSession session;
  final QuizNotifier notifier;

  void _finishQuiz(BuildContext context) {
    if (context.canPop()) {
      context.pop();
      return;
    }
    context.go(AppRoutes.home);
  }

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
                onPressed: () => _finishQuiz(context),
                child: Text(context.t.quiz.backToHome),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
