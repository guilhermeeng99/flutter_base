part of 'quiz_cubit.dart';

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

  double get progress => questions.isNotEmpty
      ? (currentIndex + (isAnswered ? 1 : 0)) / questions.length
      : 0;

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
