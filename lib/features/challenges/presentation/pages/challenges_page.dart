import 'package:flutter/material.dart';
import 'package:flutter_base/app/routes/app_router.dart';
import 'package:flutter_base/app/theme/app_colors.dart';
import 'package:flutter_base/features/challenges/data/datasources/challenges_local_datasource.dart';
import 'package:flutter_base/features/challenges/domain/entities/challenge.dart';
import 'package:flutter_base/features/challenges/presentation/widgets/challenge_card_widget.dart';
import 'package:flutter_base/gen/i18n/strings.g.dart';
import 'package:go_router/go_router.dart';

class ChallengesPage extends StatefulWidget {
  const ChallengesPage({super.key});

  @override
  State<ChallengesPage> createState() => _ChallengesPageState();
}

class _ChallengesPageState extends State<ChallengesPage> {
  final _datasource = ChallengesLocalDatasource();
  final _searchController = TextEditingController();
  late final List<Challenge> _all;
  late List<Challenge> _filtered;

  @override
  void initState() {
    super.initState();
    _all = _datasource.getAllChallenges();
    _filtered = _all;
    _searchController.addListener(_onSearch);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearch() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filtered = query.isEmpty
          ? _all
          : _all.where((c) => c.title.toLowerCase().contains(query)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.t.challenges.title,
          style: const TextStyle(fontWeight: FontWeight.w800),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: context.t.challenges.searchHint,
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Expanded(
            child: _filtered.isEmpty
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.code_off,
                          size: 64,
                          color: colors.textSecondary,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          context.t.challenges.empty,
                          style: TextStyle(
                            fontSize: 18,
                            color: colors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    itemCount: _filtered.length,
                    itemBuilder: (context, index) {
                      final challenge = _filtered[index];
                      return ChallengeCardWidget(
                        challenge: challenge,
                        onTap: () => context.push(
                          AppRoutes.challengeById(challenge.id),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
