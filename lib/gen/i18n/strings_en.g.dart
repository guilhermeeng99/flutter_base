///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final TranslationsHomeEn home = TranslationsHomeEn._(_root);
	late final TranslationsQuizEn quiz = TranslationsQuizEn._(_root);
	late final TranslationsProgressEn progress = TranslationsProgressEn._(_root);
	late final TranslationsLevelsEn levels = TranslationsLevelsEn._(_root);
	late final TranslationsCommonEn common = TranslationsCommonEn._(_root);
	late final TranslationsChallengesEn challenges = TranslationsChallengesEn._(_root);
	late final TranslationsLandingEn landing = TranslationsLandingEn._(_root);
}

// Path: home
class TranslationsHomeEn {
	TranslationsHomeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'FlutterBase'
	String get title => 'FlutterBase';

	/// en: 'Learning Path'
	String get learningPath => 'Learning Path';

	/// en: 'Daily Challenge'
	String get dailyChallenge => 'Daily Challenge';

	/// en: 'Test your Flutter knowledge!'
	String get dailyChallengeSubtitle => 'Test your Flutter knowledge!';
}

// Path: quiz
class TranslationsQuizEn {
	TranslationsQuizEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Question $current of $total'
	String questionOf({required Object current, required Object total}) => 'Question ${current} of ${total}';

	/// en: 'Check Answer'
	String get checkAnswer => 'Check Answer';

	/// en: 'Continue'
	String get continue_ => 'Continue';

	/// en: 'Correct!'
	String get correct => 'Correct!';

	/// en: 'Incorrect'
	String get incorrect => 'Incorrect';

	/// en: 'Correct answer: $answer'
	String correctAnswer({required Object answer}) => 'Correct answer: ${answer}';

	/// en: 'Level Complete!'
	String get levelComplete => 'Level Complete!';

	/// en: 'Back to Home'
	String get backToHome => 'Back to Home';

	/// en: 'No questions available for this level.'
	String get noQuestions => 'No questions available for this level.';

	/// en: 'Something went wrong.'
	String get error => 'Something went wrong.';

	/// en: '$correct/$total correct'
	String correctCount({required Object correct, required Object total}) => '${correct}/${total} correct';
}

// Path: progress
class TranslationsProgressEn {
	TranslationsProgressEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'My Progress'
	String get title => 'My Progress';

	/// en: 'Level $level'
	String level({required Object level}) => 'Level ${level}';

	/// en: '$count questions answered'
	String questionsAnswered({required Object count}) => '${count} questions answered';

	/// en: 'Statistics'
	String get statistics => 'Statistics';

	/// en: 'Accuracy'
	String get accuracy => 'Accuracy';

	/// en: 'Correct'
	String get correct => 'Correct';

	/// en: 'Total XP'
	String get totalXp => 'Total XP';

	/// en: 'Levels Done'
	String get levelsDone => 'Levels Done';

	/// en: '$count day streak'
	String dayStreak({required Object count}) => '${count} day streak';

	/// en: 'Best: $count days'
	String best({required Object count}) => 'Best: ${count} days';
}

// Path: levels
class TranslationsLevelsEn {
	TranslationsLevelsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Beginner'
	String get beginner => 'Beginner';

	/// en: 'Widgets & Basics'
	String get beginnerDesc => 'Widgets & Basics';

	/// en: 'Intermediate'
	String get intermediate => 'Intermediate';

	/// en: 'Layout & State'
	String get intermediateDesc => 'Layout & State';

	/// en: 'Advanced'
	String get advanced => 'Advanced';

	/// en: 'Architecture & Performance'
	String get advancedDesc => 'Architecture & Performance';
}

// Path: common
class TranslationsCommonEn {
	TranslationsCommonEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: '$count XP'
	String xp({required Object count}) => '${count} XP';

	/// en: '+$count XP'
	String xpEarned({required Object count}) => '+${count} XP';

	/// en: 'Loading...'
	String get loading => 'Loading...';

	/// en: 'Page not found'
	String get pageNotFound => 'Page not found';
}

// Path: challenges
class TranslationsChallengesEn {
	TranslationsChallengesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Challenges'
	String get title => 'Challenges';

	/// en: 'See code examples and practice!'
	String get subtitle => 'See code examples and practice!';

	/// en: 'No challenges yet'
	String get empty => 'No challenges yet';

	/// en: 'Challenge not found'
	String get notFound => 'Challenge not found';

	/// en: 'Copy code'
	String get copyCode => 'Copy code';

	/// en: 'Code copied!'
	String get codeCopied => 'Code copied!';

	/// en: 'Run Challenge'
	String get runChallenge => 'Run Challenge';

	/// en: 'Search challenges...'
	String get searchHint => 'Search challenges...';

	/// en: 'Explained Challenges'
	String get forumTitle => 'Explained Challenges';

	/// en: 'See code examples and practice!'
	String get forumSubtitle => 'See code examples and practice!';
}

// Path: landing
class TranslationsLandingEn {
	TranslationsLandingEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'FlutterBase'
	String get title => 'FlutterBase';

	/// en: 'Learn Flutter the fun way'
	String get subtitle => 'Learn Flutter the fun way';

	/// en: 'Master Flutter through interactive quizzes, challenges, and hands-on exercises. Level up your skills one question at a time.'
	String get description => 'Master Flutter through interactive quizzes, challenges, and hands-on exercises. Level up your skills one question at a time.';

	/// en: 'Start Learning'
	String get startButton => 'Start Learning';

	/// en: 'Interactive Quizzes'
	String get featureQuizzes => 'Interactive Quizzes';

	/// en: 'Track Progress'
	String get featureProgress => 'Track Progress';

	/// en: 'Multiple Levels'
	String get featureLevels => 'Multiple Levels';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'home.title' => 'FlutterBase',
			'home.learningPath' => 'Learning Path',
			'home.dailyChallenge' => 'Daily Challenge',
			'home.dailyChallengeSubtitle' => 'Test your Flutter knowledge!',
			'quiz.questionOf' => ({required Object current, required Object total}) => 'Question ${current} of ${total}',
			'quiz.checkAnswer' => 'Check Answer',
			'quiz.continue_' => 'Continue',
			'quiz.correct' => 'Correct!',
			'quiz.incorrect' => 'Incorrect',
			'quiz.correctAnswer' => ({required Object answer}) => 'Correct answer: ${answer}',
			'quiz.levelComplete' => 'Level Complete!',
			'quiz.backToHome' => 'Back to Home',
			'quiz.noQuestions' => 'No questions available for this level.',
			'quiz.error' => 'Something went wrong.',
			'quiz.correctCount' => ({required Object correct, required Object total}) => '${correct}/${total} correct',
			'progress.title' => 'My Progress',
			'progress.level' => ({required Object level}) => 'Level ${level}',
			'progress.questionsAnswered' => ({required Object count}) => '${count} questions answered',
			'progress.statistics' => 'Statistics',
			'progress.accuracy' => 'Accuracy',
			'progress.correct' => 'Correct',
			'progress.totalXp' => 'Total XP',
			'progress.levelsDone' => 'Levels Done',
			'progress.dayStreak' => ({required Object count}) => '${count} day streak',
			'progress.best' => ({required Object count}) => 'Best: ${count} days',
			'levels.beginner' => 'Beginner',
			'levels.beginnerDesc' => 'Widgets & Basics',
			'levels.intermediate' => 'Intermediate',
			'levels.intermediateDesc' => 'Layout & State',
			'levels.advanced' => 'Advanced',
			'levels.advancedDesc' => 'Architecture & Performance',
			'common.xp' => ({required Object count}) => '${count} XP',
			'common.xpEarned' => ({required Object count}) => '+${count} XP',
			'common.loading' => 'Loading...',
			'common.pageNotFound' => 'Page not found',
			'challenges.title' => 'Challenges',
			'challenges.subtitle' => 'See code examples and practice!',
			'challenges.empty' => 'No challenges yet',
			'challenges.notFound' => 'Challenge not found',
			'challenges.copyCode' => 'Copy code',
			'challenges.codeCopied' => 'Code copied!',
			'challenges.runChallenge' => 'Run Challenge',
			'challenges.searchHint' => 'Search challenges...',
			'challenges.forumTitle' => 'Explained Challenges',
			'challenges.forumSubtitle' => 'See code examples and practice!',
			'landing.title' => 'FlutterBase',
			'landing.subtitle' => 'Learn Flutter the fun way',
			'landing.description' => 'Master Flutter through interactive quizzes, challenges, and hands-on exercises. Level up your skills one question at a time.',
			'landing.startButton' => 'Start Learning',
			'landing.featureQuizzes' => 'Interactive Quizzes',
			'landing.featureProgress' => 'Track Progress',
			'landing.featureLevels' => 'Multiple Levels',
			_ => null,
		};
	}
}
