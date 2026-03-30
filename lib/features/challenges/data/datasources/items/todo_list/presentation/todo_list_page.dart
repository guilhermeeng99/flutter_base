import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final List<String> items = ['item 01', 'item 02'];
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onTapCreateItem(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) return;

    setState(() {
      items.add(trimmed);
      controller.clear();
    });
  }

  void onTapDeleteItem(int index) {
    final removed = items[index];
    setState(() {
      items.removeAt(index);
    });

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text('"$removed" removido'),
          action: SnackBarAction(
            label: 'Desfazer',
            onPressed: () {
              setState(() {
                items.insert(index, removed);
              });
            },
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TO-DO List')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            children: [
              Expanded(
                child: items.isEmpty
                    ? const Center(
                        child: Text(
                          'Nenhum item ainda.\nAdicione um abaixo!',
                          textAlign: TextAlign.center,
                        ),
                      )
                    : ListView.separated(
                        itemCount: items.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 8),
                        itemBuilder: (context, index) {
                          return Dismissible(
                            key: ValueKey('${items[index]}_$index'),
                            direction: DismissDirection.endToStart,
                            background: Container(
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.only(right: 16),
                              decoration: BoxDecoration(
                                color: Colors.red.shade100,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                            onDismissed: (_) => onTapDeleteItem(index),
                            child: Card(
                              margin: EdgeInsets.zero,
                              child: ListTile(
                                title: Text(items[index]),
                                trailing: IconButton(
                                  icon: const Icon(Icons.delete_outline),
                                  onPressed: () => onTapDeleteItem(index),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'Novo item...',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () => onTapCreateItem(controller.text),
                  ),
                ),
                onSubmitted: onTapCreateItem,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
