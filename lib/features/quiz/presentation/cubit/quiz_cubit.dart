import 'package:flutter_base/features/quiz/data/datasources/quiz_local_datasource.dart';
import 'package:flutter_base/features/quiz/data/repositories/quiz_repository_impl.dart';
import 'package:flutter_base/features/quiz/domain/entities/question.dart';
import 'package:flutter_base/features/quiz/domain/entities/quiz_session.dart';
import 'package:flutter_base/features/quiz/domain/usecases/get_questions_by_level.dart';
import 'package:flutter_base/features/quiz/domain/usecases/submit_answer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit({
    required GetQuestionsByLevel getQuestionsByLevel,
    required SubmitAnswer submitAnswer,
  }) : _getQuestionsByLevel = getQuestionsByLevel,
       _submitAnswer = submitAnswer,
       super(const QuizState());

  factory QuizCubit.create() {
    final datasource = QuizLocalDatasource();
    final repository = QuizRepositoryImpl(datasource);
    return QuizCubit(
      getQuestionsByLevel: GetQuestionsByLevel(repository),
      submitAnswer: const SubmitAnswer(),
    );
  }

  static final _cache = <int, QuizState>{};

  final GetQuestionsByLevel _getQuestionsByLevel;
  final SubmitAnswer _submitAnswer;
  int? _level;

  Future<void> loadQuestions(int level) async {
    _level = level;

    final cached = _cache[level];
    if (cached != null && !(cached.session?.isCompleted ?? false)) {
      emit(cached);
      return;
    }

    emit(const QuizState());
    final result = await _getQuestionsByLevel(level);
    emit(
      state.copyWith(
        questions: result,
        isLoading: false,
        session: () => QuizSession(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          level: level,
          totalQuestions: result.length,
          startedAt: DateTime.now(),
        ),
      ),
    );
  }

  @override
  void onChange(Change<QuizState> change) {
    super.onChange(change);
    final level = _level;
    if (level != null && !change.nextState.isLoading) {
      _cache[level] = change.nextState;
    }
  }

  void selectAnswer(int index) {
    if (state.isAnswered) return;
    emit(state.copyWith(selectedAnswer: () => index));
  }

  void confirmAnswer() {
    if (state.selectedAnswer == null || state.isAnswered) return;
    final question = state.currentQuestion;
    if (question == null) return;

    final result = _submitAnswer(
      question: question,
      selectedIndex: state.selectedAnswer!,
    );

    emit(
      state.copyWith(
        answerResult: () => result,
        isAnswered: true,
        session: () => _updatedSession(result),
      ),
    );
  }

  void nextQuestion() {
    if (state.isLastQuestion) {
      _completeSession();
      return;
    }

    emit(
      state.copyWith(
        currentIndex: state.currentIndex + 1,
        selectedAnswer: () => null,
        answerResult: () => null,
        isAnswered: false,
      ),
    );
  }

  void reset() => emit(const QuizState());

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
    if (_level != null) _cache.remove(_level);
    emit(
      state.copyWith(
        session: () => current.copyWith(
          isCompleted: true,
          completedAt: DateTime.now(),
        ),
      ),
    );
  }
}
