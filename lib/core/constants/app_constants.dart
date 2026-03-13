abstract class AppConstants {
  static const String appName = 'FlutterBase';
  static const String appVersion = '1.0.0';

  // Gamification
  static const int xpPerCorrectAnswer = 10;
  static const int xpBonusStreak = 5;
  static const int questionsPerLevel = 10;
  static const int maxLives = 5;
  static const int streakThreshold = 3;

  // Difficulty Levels
  static const int levelBeginner = 1;
  static const int levelIntermediate = 2;
  static const int levelAdvanced = 3;
  static const int levelExpert = 4;

  // Storage Keys
  static const String keyUserProgress = 'user_progress';
  static const String keyQuizHistory = 'quiz_history';
  static const String keyStreak = 'streak';
  static const String keyLastActiveDate = 'last_active_date';
}
