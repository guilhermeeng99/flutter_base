import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base/app/routes/app_router.dart';
import 'package:flutter_base/app/theme/app_colors.dart';
import 'package:flutter_base/features/challenges/data/datasources/challenges_local_datasource.dart';
import 'package:flutter_base/gen/i18n/strings.g.dart';
import 'package:go_router/go_router.dart';

class ChallengeDetailPage extends StatelessWidget {
  ChallengeDetailPage({required this.challengeId, super.key});

  final String challengeId;
  final _datasource = ChallengesLocalDatasource();

  @override
  Widget build(BuildContext context) {
    final challenge = _datasource.getChallengeById(challengeId);
    final colors = context.appColors;

    if (challenge == null) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(child: Text(context.t.challenges.notFound)),
      );
    }

    final hasRunner =
        ChallengesLocalDatasource.allChallenges
            .where((e) => e.challenge.id == challengeId)
            .firstOrNull
            ?.isRunnable ??
        false;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          challenge.title,
          style: const TextStyle(fontWeight: FontWeight.w800),
        ),
      ),
      body: FutureBuilder<String>(
        future: DefaultAssetBundle.of(
          context,
        ).loadString(challenge.codeAssetPath),
        builder: (context, snapshot) {
          final code = snapshot.data ?? '';
          final isLoading = snapshot.connectionState != ConnectionState.done;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Text(
                    challenge.description,
                    style: TextStyle(
                      fontSize: 15,
                      color: colors.textSecondary,
                      height: 1.5,
                    ),
                  ),
                ),
                if (hasRunner) ...[
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: FilledButton.icon(
                      icon: const Icon(Icons.play_arrow_rounded),
                      label: Text(context.t.challenges.runChallenge),
                      onPressed: () =>
                          context.push(AppRoutes.challengeRunById(challengeId)),
                    ),
                  ),
                ],
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (!isLoading && code.isNotEmpty)
                        IconButton(
                          icon: const Icon(Icons.copy, size: 18),
                          tooltip: context.t.challenges.copyCode,
                          onPressed: () async {
                            await Clipboard.setData(ClipboardData(text: code));
                            if (!context.mounted) return;
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(context.t.challenges.codeCopied),
                                backgroundColor: colors.primary,
                                duration: const Duration(seconds: 2),
                              ),
                            );
                          },
                        ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: colors.codeBackground,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: colors.codeBorder),
                    ),
                    child: isLoading
                        ? const Padding(
                            padding: EdgeInsets.all(32),
                            child: Center(child: CircularProgressIndicator()),
                          )
                        : SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: SelectableText(
                                code,
                                style: TextStyle(
                                  fontFamily: 'Fira Code',
                                  fontSize: 13,
                                  color: colors.codeText,
                                  height: 1.6,
                                ),
                              ),
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          );
        },
      ),
    );
  }
}
