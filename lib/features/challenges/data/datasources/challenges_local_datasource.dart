import 'package:flutter_base/features/challenges/data/challenge_entry.dart';
import 'package:flutter_base/features/challenges/data/datasources/items/mock_simple_chat/data/mock_simple_chat_entry.dart';
import 'package:flutter_base/features/challenges/domain/entities/challenge.dart';

class ChallengesLocalDatasource {
  static final allChallenges = <ChallengeEntry>[mockSimpleChat];

  List<Challenge> getAllChallenges() =>
      allChallenges.map((e) => e.challenge).toList();

  Challenge? getChallengeById(String id) => allChallenges
      .where((e) => e.challenge.id == id)
      .map((e) => e.challenge)
      .firstOrNull;
}
