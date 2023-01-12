import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:to_do_list/store/todo_list_store.dart';
import 'package:to_do_list/todoItem.dart';
import 'package:to_do_list/todo_db_service.dart';
import 'package:uuid/uuid.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @observable
  late final _todoStore;

  @override
  void initState() {
    _todoStore = TodoStore(uuid: const Uuid(), todoDbService: TodoDbService());
    _todoStore.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do List'),
        leading: GestureDetector(
          onTap: () {
            _todoStore.deleteDoneTodoItems();
          },
          child: Icon(
            Icons.auto_delete_outlined,
          ),
        ),
      ),
      body: Observer(
        builder: (_) => ListView.builder(
            itemCount: _todoStore.todos.length,
            itemBuilder: (context, index) {
              return TodoItem(
                todo: _todoStore.todos[index],
                onTodoChanged: _todoStore.handleTodoChange,
                todoDelete: _todoStore.deleteTodoItem,
                todoEdit: _todoStore.editTodoItem,
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _displayAddDialog(),
          tooltip: 'Add Task',
          child: const Icon(Icons.add)),
    );
  }

  Future<void> _displayAddDialog() async {
    final TextEditingController textFieldController = TextEditingController();
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add a new todo item'),
          content: TextField(
            controller: textFieldController,
            decoration: const InputDecoration(hintText: 'Type your new todo'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                Navigator.of(context).pop();
                _todoStore.addTodoItem(textFieldController.text);
              },
            ),
          ],
        );
      },
    );
  }
}
