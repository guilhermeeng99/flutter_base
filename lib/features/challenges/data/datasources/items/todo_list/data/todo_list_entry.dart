import 'package:flutter_base/features/challenges/data/challenge_entry.dart';
import 'package:flutter_base/features/challenges/data/datasources/items/todo_list/presentation/todo_list_page.dart';
import 'package:flutter_base/features/challenges/domain/entities/challenge.dart';
import 'package:flutter_base/gen/assets.gen.dart';

final todoList = ChallengeEntry(
  challenge: Challenge(
    id: 'todo_list',
    title: 'Todo List',
    description:
        'A todo list with checkboxes, a text input to add items and a delete button.',
    codeAssetPath: Assets
        .lib
        .features
        .challenges
        .data
        .datasources
        .items
        .todoList
        .presentation
        .todoListPage,
  ),
  builder: (_) => const TodoListPage(),
);
