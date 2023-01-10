import 'dart:async';

import 'package:flutter/material.dart';
import 'package:to_do_list/toDo.dart';
import 'package:to_do_list/todoItem.dart';
import 'package:uuid/uuid.dart';


class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final List<Todo> _todos = <Todo>[];
  var uuid = Uuid();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do List'),
      ),
      body: ListView.builder(
          itemCount: _todos.length,
          itemBuilder: (context, index) {
            return TodoItem(
              id: uuid.v1(),
              todo: _todos[index],
              onTodoChanged: _handleTodoChange,
              todoDelete: _deleteTodoItem,
              todoEdit: _editTodoItem,
            );
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _displayAddDialog(),
          tooltip: 'Add Task',
          child: const Icon(Icons.add)),
    );
  }

  void _handleTodoChange(Todo todo) {
    setState(() {
      todo = todo.copyWith(checked: !todo.checked);
    });
  }

  void _addTodoItem(String name) {
    setState(() {
      _todos.add(Todo(id: uuid.v1(), name: name, checked: false));
    });
  }

  void _deleteTodoItem(String id) {
    setState(() {
      _todos.removeWhere((item) => item.id == id);
    });
  }

  void _editTodoItem(String id, String name, bool isEdit) {
    setState(() {
      _todos[_todos.indexWhere((element) => element.id == id)] =
          Todo(id: id, name: name, checked: false, isEdit: isEdit);
    });
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
                _addTodoItem(textFieldController.text);
              },
            ),
          ],
        );
      },
    );
  }
}
