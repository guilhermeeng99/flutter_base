import 'package:flutter_base/features/challenges/data/challenge_entry.dart';
import 'package:flutter_base/features/challenges/data/datasources/items/calculator/presentation/calculator_page.dart';
import 'package:flutter_base/features/challenges/domain/entities/challenge.dart';
import 'package:flutter_base/gen/assets.gen.dart';

final calculator = ChallengeEntry(
  challenge: Challenge(
    id: 'calculator',
    title: 'Calculator',
    description:
        'A basic calculator with addition, subtraction, multiplication and division.',
    codeAssetPath: Assets
        .lib
        .features
        .challenges
        .data
        .datasources
        .items
        .calculator
        .presentation
        .calculatorPage,
  ),
  builder: (_) => const CalculatorPage(),
);
