import 'package:flutter/material.dart';

class MockChatPage extends StatefulWidget {
  const MockChatPage({super.key});

  @override
  State<MockChatPage> createState() => _MockChatPageState();
}

class _MockChatPageState extends State<MockChatPage> {
  final List<String> messages = ['Test 01', 'Test 02'];
  final TextEditingController textController = TextEditingController();

  void onTapSendMessage(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) return;
    setState(() {
      messages.add(trimmed);
      textController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 15,
                ),
                itemBuilder: (context, index) {
                  return Text(messages[index]);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(controller: textController),
                  ),
                  InkWell(
                    onTap: () => onTapSendMessage(textController.text),
                    child: const Icon(Icons.send),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
