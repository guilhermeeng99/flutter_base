import 'package:flutter/widgets.dart';
import 'package:flutter_base/features/challenges/domain/entities/challenge.dart';

class ChallengeEntry {
  const ChallengeEntry({required this.challenge, this.builder});

  final Challenge challenge;

  final WidgetBuilder? builder;

  bool get isRunnable => builder != null;
}
