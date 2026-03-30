import 'package:flutter_base/features/challenges/data/challenge_entry.dart';
import 'package:flutter_base/features/challenges/data/datasources/items/countdown_timer/presentation/countdown_timer_page.dart';
import 'package:flutter_base/features/challenges/domain/entities/challenge.dart';
import 'package:flutter_base/gen/assets.gen.dart';

final countdownTimer = ChallengeEntry(
  challenge: Challenge(
    id: 'countdown_timer',
    title: 'Countdown Timer',
    description: 'A countdown timer with start, pause and reset controls.',
    codeAssetPath: Assets
        .lib
        .features
        .challenges
        .data
        .datasources
        .items
        .countdownTimer
        .presentation
        .countdownTimerPage,
  ),
  builder: (_) => const CountdownTimerPage(),
);
