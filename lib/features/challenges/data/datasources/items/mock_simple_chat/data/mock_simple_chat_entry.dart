import 'package:flutter_base/features/challenges/data/challenge_entry.dart';
import 'package:flutter_base/features/challenges/data/datasources/items/mock_simple_chat/presentation/mock_simple_chat_page.dart';
import 'package:flutter_base/features/challenges/domain/entities/challenge.dart';
import 'package:flutter_base/gen/assets.gen.dart';

final mockSimpleChat = ChallengeEntry(
  challenge: Challenge(
    id: 'mock_simple_chat',
    title: 'Mock Chat',
    description:
        'A simple mock chat with messages, a text input and a send button.',
    codeAssetPath: Assets
        .lib
        .features
        .challenges
        .data
        .datasources
        .items
        .mockSimpleChat
        .presentation
        .mockSimpleChatPage,
  ),
  builder: (_) => const MockChatPage(),
);
