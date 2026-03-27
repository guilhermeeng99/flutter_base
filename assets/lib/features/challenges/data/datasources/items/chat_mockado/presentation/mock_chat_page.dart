import 'package:flutter/material.dart';
import 'package:flutter_base/features/challenges/data/challenge_entry.dart';
import 'package:flutter_base/features/challenges/domain/entities/challenge.dart';

final mockChatEntry = ChallengeEntry(
  challenge: const Challenge(
    id: 'chat_mockado',
    title: 'Mock Chat',
    description:
        'A simple mock chat with messages, a text input and a send button.',
    codeAssetPath:
        'lib/features/challenges/data/datasources/items/chat_mockado/presentation/mock_chat_page.dart',
  ),
  builder: (_) => const MockChatPage(),
);

class ChatMessage {
  ChatMessage({required this.text, required this.isMe, DateTime? timestamp})
    : timestamp = timestamp ?? DateTime.now();

  final String text;
  final bool isMe;
  final DateTime timestamp;
}

class MockChatPage extends StatefulWidget {
  const MockChatPage({super.key});

  @override
  State<MockChatPage> createState() => _MockChatPageState();
}

class _MockChatPageState extends State<MockChatPage> {
  final _controller = TextEditingController();
  final _messages = <ChatMessage>[
    ChatMessage(text: 'Hi! How are you?', isMe: false),
    ChatMessage(text: 'Good! And you?', isMe: true),
    ChatMessage(text: "Great! Let's code?", isMe: false),
  ];

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _messages.add(ChatMessage(text: text, isMe: true));
      _controller.clear();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mock Chat')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                return Align(
                  alignment: msg.isMe
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: msg.isMe ? Colors.blue : Colors.grey[300],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      msg.text,
                      style: TextStyle(
                        color: msg.isMe ? Colors.white : Colors.black87,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
