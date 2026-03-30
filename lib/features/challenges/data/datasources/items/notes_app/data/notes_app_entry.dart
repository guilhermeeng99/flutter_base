import 'package:flutter_base/features/challenges/data/challenge_entry.dart';
import 'package:flutter_base/features/challenges/data/datasources/items/notes_app/presentation/notes_app_page.dart';
import 'package:flutter_base/features/challenges/domain/entities/challenge.dart';
import 'package:flutter_base/gen/assets.gen.dart';

final notesApp = ChallengeEntry(
  challenge: Challenge(
    id: 'notes_app',
    title: 'Notes App',
    description: 'A notes app with create, edit and delete functionality.',
    codeAssetPath: Assets
        .lib
        .features
        .challenges
        .data
        .datasources
        .items
        .notesApp
        .presentation
        .notesAppPage,
  ),
  builder: (_) => const NotesAppPage(),
);
