import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:to_do_list/todo_history/store/todo_history_list_store.dart';
import 'package:to_do_list/todo_history/todo_history_item.dart';
import 'package:go_router/go_router.dart';

import '../todo_list/todo_list_screen.dart';

class TodoHistoryList extends StatefulWidget {
  const TodoHistoryList({super.key});

  @override
  _TodoHistoryListState createState() => _TodoHistoryListState();
}

class _TodoHistoryListState extends State<TodoHistoryList> {
  @override
  void initState() {
    TodoHistoryStore.of(context).init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do List'),
        leading: GestureDetector(
          onTap: () {
            context.go('/');
          },
          child: const Icon(
            Icons.arrow_back,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.delete_forever),
            tooltip: 'Delete all',
            onPressed: () {
              TodoHistoryStore.of(context).deleteHistoryTodoItems();
            },
          ),
        ],
      ),
      body: Observer(
        builder: (_) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.5),
                crossAxisCount: 2,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
              ),
              itemCount: TodoHistoryStore.of(context).todos.length,
              itemBuilder: (context, index) => TodoHistoryItem(
                  todo: TodoHistoryStore.of(context).todos[index])),
        ),
      ),
    );
  }
}
