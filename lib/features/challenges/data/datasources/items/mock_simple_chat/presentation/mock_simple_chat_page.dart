import 'package:flutter/material.dart';

class MockChatPage extends StatefulWidget {
  const MockChatPage({super.key});

  @override
  State<MockChatPage> createState() => _MockChatPageState();
}

class _MockChatPageState extends State<MockChatPage> {
  final List<String> messages = ['message 01', 'message 02'];
  final TextEditingController textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

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
      appBar: AppBar(title: const Text('Mock Chat')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: messages.length,
                itemBuilder: (_, index) {
                  return Text(messages[index]);
                },
                separatorBuilder: (_, index) {
                  return const SizedBox(width: 10, height: 10);
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textController,
                  ),
                ),
                InkWell(
                  onTap: () => onTapSendMessage(textController.text),
                  child: const Icon(Icons.send),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
