import 'package:flutter/material.dart';
import 'package:flutter_base/features/challenges/data/datasources/challenges_local_datasource.dart';
import 'package:flutter_base/gen/i18n/strings.g.dart';

class ChallengeRunnerPage extends StatelessWidget {
  const ChallengeRunnerPage({required this.challengeId, super.key});

  final String challengeId;

  @override
  Widget build(BuildContext context) {
    final builder = ChallengesLocalDatasource.allChallenges
        .where((e) => e.challenge.id == challengeId)
        .firstOrNull
        ?.builder;

    if (builder == null) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(child: Text(context.t.challenges.notFound)),
      );
    }

    return builder(context);
  }
}
