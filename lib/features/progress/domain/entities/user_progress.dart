class UserProgress {
  const UserProgress({
    this.totalXp = 0,
    this.currentLevel = 1,
    this.currentStreak = 0,
    this.longestStreak = 0,
    this.questionsAnswered = 0,
    this.correctAnswers = 0,
    this.completedLevels = const [],
    this.lastActiveDate,
  });

  final int totalXp;
  final int currentLevel;
  final int currentStreak;
  final int longestStreak;
  final int questionsAnswered;
  final int correctAnswers;
  final List<int> completedLevels;
  final DateTime? lastActiveDate;

  double get accuracyPercent =>
      questionsAnswered > 0 ? correctAnswers / questionsAnswered * 100 : 0;

  UserProgress copyWith({
    int? totalXp,
    int? currentLevel,
    int? currentStreak,
    int? longestStreak,
    int? questionsAnswered,
    int? correctAnswers,
    List<int>? completedLevels,
    DateTime? lastActiveDate,
  }) {
    return UserProgress(
      totalXp: totalXp ?? this.totalXp,
      currentLevel: currentLevel ?? this.currentLevel,
      currentStreak: currentStreak ?? this.currentStreak,
      longestStreak: longestStreak ?? this.longestStreak,
      questionsAnswered: questionsAnswered ?? this.questionsAnswered,
      correctAnswers: correctAnswers ?? this.correctAnswers,
      completedLevels: completedLevels ?? this.completedLevels,
      lastActiveDate: lastActiveDate ?? this.lastActiveDate,
    );
  }
}
