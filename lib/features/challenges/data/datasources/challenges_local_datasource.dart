import 'package:flutter_base/features/challenges/data/challenge_entry.dart';
import 'package:flutter_base/features/challenges/data/datasources/items/calculator/data/calculator_entry.dart';
import 'package:flutter_base/features/challenges/data/datasources/items/color_picker/data/color_picker_entry.dart';
import 'package:flutter_base/features/challenges/data/datasources/items/countdown_timer/data/countdown_timer_entry.dart';
import 'package:flutter_base/features/challenges/data/datasources/items/mock_simple_chat/data/mock_simple_chat_entry.dart';
import 'package:flutter_base/features/challenges/data/datasources/items/notes_app/data/notes_app_entry.dart';
import 'package:flutter_base/features/challenges/data/datasources/items/todo_list/data/todo_list_entry.dart';
import 'package:flutter_base/features/challenges/domain/entities/challenge.dart';

class ChallengesLocalDatasource {
  static final allChallenges = <ChallengeEntry>[
    mockSimpleChat,
    todoList,
    countdownTimer,
    colorPicker,
    notesApp,
    calculator,
  ];

  List<Challenge> getAllChallenges() =>
      allChallenges.map((e) => e.challenge).toList();

  Challenge? getChallengeById(String id) => allChallenges
      .where((e) => e.challenge.id == id)
      .map((e) => e.challenge)
      .firstOrNull;
}
