import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:to_do_list/store/todo_list_store.dart';
import 'package:to_do_list/todo_item.dart';
import 'package:to_do_list/todo_db_service.dart';
import 'package:uuid/uuid.dart';

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
      ),
      body: Observer(
        builder: (_) => ListView.builder(
          itemCount: TodoStore.of(context).todos.length,
          itemBuilder: (context, index) {
            return TodoItem(
              todo: TodoStore.of(context).todos[index],
              onTodoChanged: TodoStore.of(context).handleTodoChange,
              todoDelete: TodoStore.of(context).deleteTodoItem,
              todoEdit: TodoStore.of(context).editTodoItem,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _displayAddDialog(TodoStore.of(context).addTodoItem),
          tooltip: 'Add Task',
          child: const Icon(Icons.add)),
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
