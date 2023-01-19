import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:to_do_list/todo_history/store/todo_history_list_store.dart';
import 'package:to_do_list/todo_history/todo_history_item.dart';
import 'package:to_do_list/todo_list/todo_item.dart';
import 'package:go_router/go_router.dart';

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
      ),
      body: Observer(
        builder: (_) => SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Wrap(
            direction: Axis.horizontal,
            alignment: WrapAlignment.start,
            spacing: 5.0,
            runSpacing: 5.0,
            children: TodoHistoryStore.of(context)
                .todos
                .map((item) => TodoHistoryItem(todo: item))
                .toList()
                .cast<Widget>(),
          ),
        ),
      ),
    );
  }
}
