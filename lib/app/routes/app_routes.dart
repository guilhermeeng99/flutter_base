abstract class AppRoutes {
  static const String landing = '/';
  static const String home = '/home';
  static const String quiz = '/quiz/:level';
  static const String progress = '/progress';

  static String quizByLevel(int level) => '/quiz/$level';
}
