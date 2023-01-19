import 'dart:async';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:to_do_list/todo_list/store/todo_list_store.dart';
import 'package:to_do_list/todo_list/todo_item.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  void initState() {
    TodoStore.of(context).init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do List'),
        leading: GestureDetector(
          onTap: () {
            TodoStore.of(context).deleteDoneTodoItems();
          },
          child: const Icon(
            Icons.auto_delete_outlined,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.history),
            tooltip: 'Show history',
            onPressed: () {
              context.goNamed(
                'todo_history_list',
              );
            },
          ),
        ],
      ),
      body: Observer(
        builder: (_) => SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Align(
            alignment: Alignment.center,
            child: Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.start,
              spacing: 5.0,
              runSpacing: 5.0,
              children: TodoStore.of(context)
                  .todos
                  .map((item) => TodoItem(
                        todo: item,
                        onTodoChanged: TodoStore.of(context).handleTodoChange,
                        todoDelete: TodoStore.of(context).deleteTodoItem,
                        todoEdit: TodoStore.of(context).editTodoItem,
                      ))
                  .toList()
                  .cast<Widget>(),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _displayAddDialog(TodoStore.of(context).addTodoItem),
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _displayAddDialog(
    Function(String title, String description) onCreate,
  ) async {
    final TextEditingController nameTextFieldController =
        TextEditingController();
    final TextEditingController descriptionTextFieldController =
        TextEditingController();

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add a new todo item'),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: nameTextFieldController,
                decoration:
                    const InputDecoration(hintText: 'Type name of new todo'),
              ),
              TextField(
                controller: descriptionTextFieldController,
                decoration: const InputDecoration(hintText: 'Type description'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                Navigator.of(context).pop();
                onCreate(
                  nameTextFieldController.text,
                  descriptionTextFieldController.text,
                );
              },
            ),
          ],
        );
      },
    );
  }
}
