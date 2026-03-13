class QuizSession {
  const QuizSession({
    required this.id,
    required this.level,
    required this.totalQuestions,
    this.currentIndex = 0,
    this.correctAnswers = 0,
    this.wrongAnswers = 0,
    this.xpEarned = 0,
    this.isCompleted = false,
    this.startedAt,
    this.completedAt,
  });

  final String id;
  final int level;
  final int totalQuestions;
  final int currentIndex;
  final int correctAnswers;
  final int wrongAnswers;
  final int xpEarned;
  final bool isCompleted;
  final DateTime? startedAt;
  final DateTime? completedAt;

  double get progressPercent =>
      totalQuestions > 0 ? currentIndex / totalQuestions : 0;

  int get remainingQuestions => totalQuestions - currentIndex;

  QuizSession copyWith({
    int? currentIndex,
    int? correctAnswers,
    int? wrongAnswers,
    int? xpEarned,
    bool? isCompleted,
    DateTime? completedAt,
  }) {
    return QuizSession(
      id: id,
      level: level,
      totalQuestions: totalQuestions,
      currentIndex: currentIndex ?? this.currentIndex,
      correctAnswers: correctAnswers ?? this.correctAnswers,
      wrongAnswers: wrongAnswers ?? this.wrongAnswers,
      xpEarned: xpEarned ?? this.xpEarned,
      isCompleted: isCompleted ?? this.isCompleted,
      startedAt: startedAt,
      completedAt: completedAt ?? this.completedAt,
    );
  }
}
