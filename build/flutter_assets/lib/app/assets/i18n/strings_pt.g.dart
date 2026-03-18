///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsPt with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsPt({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.pt,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <pt>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsPt _root = this; // ignore: unused_field

	@override 
	TranslationsPt $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsPt(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsHomePt home = _TranslationsHomePt._(_root);
	@override late final _TranslationsQuizPt quiz = _TranslationsQuizPt._(_root);
	@override late final _TranslationsProgressPt progress = _TranslationsProgressPt._(_root);
	@override late final _TranslationsLevelsPt levels = _TranslationsLevelsPt._(_root);
	@override late final _TranslationsCommonPt common = _TranslationsCommonPt._(_root);
	@override late final _TranslationsLandingPt landing = _TranslationsLandingPt._(_root);
}

// Path: home
class _TranslationsHomePt implements TranslationsHomeEn {
	_TranslationsHomePt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'FlutterBase';
	@override String get learningPath => 'Trilha de Aprendizado';
	@override String get dailyChallenge => 'Desafio Diário';
	@override String get dailyChallengeSubtitle => 'Teste seu conhecimento em Flutter!';
}

// Path: quiz
class _TranslationsQuizPt implements TranslationsQuizEn {
	_TranslationsQuizPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String questionOf({required Object current, required Object total}) => 'Questão ${current} de ${total}';
	@override String get checkAnswer => 'Verificar Resposta';
	@override String get continue_ => 'Continuar';
	@override String get correct => 'Correto!';
	@override String get incorrect => 'Incorreto';
	@override String correctAnswer({required Object answer}) => 'Resposta correta: ${answer}';
	@override String get levelComplete => 'Nível Completo!';
	@override String get backToHome => 'Voltar ao Início';
	@override String get noQuestions => 'Nenhuma questão disponível para este nível.';
	@override String get error => 'Algo deu errado.';
	@override String correctCount({required Object correct, required Object total}) => '${correct}/${total} corretas';
}

// Path: progress
class _TranslationsProgressPt implements TranslationsProgressEn {
	_TranslationsProgressPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Meu Progresso';
	@override String level({required Object level}) => 'Nível ${level}';
	@override String questionsAnswered({required Object count}) => '${count} questões respondidas';
	@override String get statistics => 'Estatísticas';
	@override String get accuracy => 'Precisão';
	@override String get correct => 'Corretas';
	@override String get totalXp => 'XP Total';
	@override String get levelsDone => 'Níveis Concluídos';
	@override String dayStreak({required Object count}) => '${count} dias seguidos';
	@override String best({required Object count}) => 'Melhor: ${count} dias';
}

// Path: levels
class _TranslationsLevelsPt implements TranslationsLevelsEn {
	_TranslationsLevelsPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get beginner => 'Iniciante';
	@override String get beginnerDesc => 'Widgets & Básico';
	@override String get intermediate => 'Intermediário';
	@override String get intermediateDesc => 'Layout & Estado';
	@override String get advanced => 'Avançado';
	@override String get advancedDesc => 'Arquitetura & Performance';
}

// Path: common
class _TranslationsCommonPt implements TranslationsCommonEn {
	_TranslationsCommonPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String xp({required Object count}) => '${count} XP';
	@override String xpEarned({required Object count}) => '+${count} XP';
	@override String get loading => 'Carregando...';
	@override String get pageNotFound => 'Página não encontrada';
}

// Path: landing
class _TranslationsLandingPt implements TranslationsLandingEn {
	_TranslationsLandingPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'FlutterBase';
	@override String get subtitle => 'Aprenda Flutter de forma divertida';
	@override String get description => 'Domine Flutter através de quizzes interativos, desafios e exercícios práticos. Suba de nível uma questão por vez.';
	@override String get startButton => 'Começar a Aprender';
	@override String get featureQuizzes => 'Quizzes Interativos';
	@override String get featureProgress => 'Acompanhe seu Progresso';
	@override String get featureLevels => 'Múltiplos Níveis';
}

/// The flat map containing all translations for locale <pt>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsPt {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'home.title' => 'FlutterBase',
			'home.learningPath' => 'Trilha de Aprendizado',
			'home.dailyChallenge' => 'Desafio Diário',
			'home.dailyChallengeSubtitle' => 'Teste seu conhecimento em Flutter!',
			'quiz.questionOf' => ({required Object current, required Object total}) => 'Questão ${current} de ${total}',
			'quiz.checkAnswer' => 'Verificar Resposta',
			'quiz.continue_' => 'Continuar',
			'quiz.correct' => 'Correto!',
			'quiz.incorrect' => 'Incorreto',
			'quiz.correctAnswer' => ({required Object answer}) => 'Resposta correta: ${answer}',
			'quiz.levelComplete' => 'Nível Completo!',
			'quiz.backToHome' => 'Voltar ao Início',
			'quiz.noQuestions' => 'Nenhuma questão disponível para este nível.',
			'quiz.error' => 'Algo deu errado.',
			'quiz.correctCount' => ({required Object correct, required Object total}) => '${correct}/${total} corretas',
			'progress.title' => 'Meu Progresso',
			'progress.level' => ({required Object level}) => 'Nível ${level}',
			'progress.questionsAnswered' => ({required Object count}) => '${count} questões respondidas',
			'progress.statistics' => 'Estatísticas',
			'progress.accuracy' => 'Precisão',
			'progress.correct' => 'Corretas',
			'progress.totalXp' => 'XP Total',
			'progress.levelsDone' => 'Níveis Concluídos',
			'progress.dayStreak' => ({required Object count}) => '${count} dias seguidos',
			'progress.best' => ({required Object count}) => 'Melhor: ${count} dias',
			'levels.beginner' => 'Iniciante',
			'levels.beginnerDesc' => 'Widgets & Básico',
			'levels.intermediate' => 'Intermediário',
			'levels.intermediateDesc' => 'Layout & Estado',
			'levels.advanced' => 'Avançado',
			'levels.advancedDesc' => 'Arquitetura & Performance',
			'common.xp' => ({required Object count}) => '${count} XP',
			'common.xpEarned' => ({required Object count}) => '+${count} XP',
			'common.loading' => 'Carregando...',
			'common.pageNotFound' => 'Página não encontrada',
			'landing.title' => 'FlutterBase',
			'landing.subtitle' => 'Aprenda Flutter de forma divertida',
			'landing.description' => 'Domine Flutter através de quizzes interativos, desafios e exercícios práticos. Suba de nível uma questão por vez.',
			'landing.startButton' => 'Começar a Aprender',
			'landing.featureQuizzes' => 'Quizzes Interativos',
			'landing.featureProgress' => 'Acompanhe seu Progresso',
			'landing.featureLevels' => 'Múltiplos Níveis',
			_ => null,
		};
	}
}
