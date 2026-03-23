import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_base/app/routes/app_router.dart';
import 'package:flutter_base/app/theme/app_colors.dart';
import 'package:flutter_base/features/progress/presentation/cubit/progress_cubit.dart';
import 'package:flutter_base/features/quiz/domain/entities/question_type.dart';
import 'package:flutter_base/features/quiz/domain/entities/quiz_session.dart';
import 'package:flutter_base/features/quiz/presentation/cubit/quiz_cubit.dart';
import 'package:flutter_base/features/quiz/presentation/widgets/answer_feedback_widget.dart';
import 'package:flutter_base/features/quiz/presentation/widgets/code_question_widget.dart';
import 'package:flutter_base/features/quiz/presentation/widgets/fill_blank_widget.dart';
import 'package:flutter_base/features/quiz/presentation/widgets/multiple_choice_widget.dart';
import 'package:flutter_base/features/quiz/presentation/widgets/question_card.dart';
import 'package:flutter_base/gen/i18n/strings.g.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({required this.level, super.key});
  final int level;

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
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
    unawaited(context.read<QuizCubit>().loadQuestions(widget.level));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizCubit, QuizState>(
      listenWhen: (prev, curr) => !prev.isAnswered && curr.isAnswered,
      listener: (context, state) {
        final xp = state.answerResult?.xpEarned ?? 0;
        if (xp > 0) {
          unawaited(context.read<ProgressCubit>().addXp(xp));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => _closeQuiz(context),
            ),
            title: LinearProgressIndicator(
              value: state.progress,
              backgroundColor: context.appColors.border,
              valueColor: AlwaysStoppedAnimation<Color>(
                context.appColors.primary,
              ),
              minHeight: 10,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          body: _buildBody(context, state),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, QuizState state) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.questions.isEmpty) {
      return Center(child: Text(context.t.quiz.noQuestions));
    }

    final session = state.session;
    if (session != null && session.isCompleted) {
      return _QuizCompleteView(session: session);
    }

    final question = state.currentQuestion;
    if (question == null) {
      return Center(child: Text(context.t.quiz.error));
    }

    final cubit = context.read<QuizCubit>();

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
          _buildQuestionTypeWidget(context, state, cubit),
          const SizedBox(height: 16),
          if (!state.isAnswered)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: state.selectedAnswer != null
                      ? cubit.confirmAnswer
                      : null,
                  child: Text(context.t.quiz.checkAnswer),
                ),
              ),
            ),
          if (state.isAnswered && state.answerResult != null)
            AnswerFeedbackWidget(
              result: state.answerResult!,
              onNext: cubit.nextQuestion,
            ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildQuestionTypeWidget(
    BuildContext context,
    QuizState state,
    QuizCubit cubit,
  ) {
    final q = state.currentQuestion!;
    switch (q.type) {
      case QuestionType.fillInTheBlank:
        return FillBlankWidget(
          options: q.options,
          selectedIndex: state.selectedAnswer,
          correctAnswerIndex: state.isAnswered ? q.correctAnswerIndex : null,
          isAnswered: state.isAnswered,
          onSelected: cubit.selectAnswer,
        );
      case QuestionType.codeBased:
        return CodeQuestionWidget(
          codeSnippet: q.codeSnippet ?? '',
          options: q.options,
          selectedIndex: state.selectedAnswer,
          correctAnswerIndex: state.isAnswered ? q.correctAnswerIndex : null,
          isAnswered: state.isAnswered,
          onSelected: cubit.selectAnswer,
        );
      case QuestionType.multipleChoice:
        return MultipleChoiceWidget(
          options: q.options,
          selectedIndex: state.selectedAnswer,
          correctAnswerIndex: state.isAnswered ? q.correctAnswerIndex : null,
          isAnswered: state.isAnswered,
          onSelected: cubit.selectAnswer,
        );
    }
  }
}

class _QuizCompleteView extends StatelessWidget {
  const _QuizCompleteView({required this.session});

  final QuizSession session;

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
            const Icon(Icons.emoji_events, size: 80, color: Color(0xFFFBBF24)),
            const SizedBox(height: 24),
            Text(
              context.t.quiz.levelComplete,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: context.appColors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              context.t.quiz.correctCount(
                correct: session.correctAnswers,
                total: session.totalQuestions,
              ),
              style: TextStyle(
                fontSize: 20,
                color: context.appColors.textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                color: context.appColors.xpGold.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                context.t.common.xpEarned(count: session.xpEarned),
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: context.appColors.accentDark,
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
