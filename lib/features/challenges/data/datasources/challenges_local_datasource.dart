import 'package:flutter_base/features/challenges/data/challenge_entry.dart';
import 'package:flutter_base/features/challenges/data/datasources/items/chat_mockado/presentation/mock_chat_page.dart';
import 'package:flutter_base/features/challenges/domain/entities/challenge.dart';

class ChallengesLocalDatasource {
  static final allChallenges = <ChallengeEntry>[mockChatEntry];

  List<Challenge> getAllChallenges() =>
      allChallenges.map((e) => e.challenge).toList();

  Challenge? getChallengeById(String id) => allChallenges
      .where((e) => e.challenge.id == id)
      .map((e) => e.challenge)
      .firstOrNull;
}
