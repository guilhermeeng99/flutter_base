import 'package:flutter_base/features/challenges/data/challenge_entry.dart';
import 'package:flutter_base/features/challenges/data/datasources/items/color_picker/presentation/color_picker_page.dart';
import 'package:flutter_base/features/challenges/domain/entities/challenge.dart';
import 'package:flutter_base/gen/assets.gen.dart';

final colorPicker = ChallengeEntry(
  challenge: Challenge(
    id: 'color_picker',
    title: 'Color Picker',
    description: 'A color picker with RGB sliders and a live color preview.',
    codeAssetPath: Assets
        .lib
        .features
        .challenges
        .data
        .datasources
        .items
        .colorPicker
        .presentation
        .colorPickerPage,
  ),
  builder: (_) => const ColorPickerPage(),
);
