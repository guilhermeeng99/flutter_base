abstract class ApiEndpoints {
  static const String baseUrl = 'https://api.flutterbase.dev/v1';

  // Quiz
  static const String questions = '/questions';
  static String questionsByLevel(int level) => '/questions?level=$level';
  static String questionById(String id) => '/questions/$id';

  // Progress
  static const String progress = '/progress';
  static const String leaderboard = '/leaderboard';
}
