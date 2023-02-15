import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/todo.dart';

class TodoDbProvider {
  TodoDbProvider({required this.todoBox});

  static TodoDbProvider of(context) => Provider.of(context, listen: false);
  Box<Todo> todoBox;

  Future<void> addTodo(Todo todo) async {
    await todoBox.put(todo.id, todo);
  }

  Future<void> updateTodo(int index, Todo todo) async {
    todoBox.putAt(index, todo);
  }

  Future<List<Todo>> getTodos() async {
    List<Todo> todos = todoBox.values.toList();
    return todos;
  }

  Future<void> deleteTodo(int index) async {
    todoBox.deleteAt(index);
  }

  deleteHistoryTodoItems(List keys) {
    todoBox.deleteAll(keys);
  }

  String encode(List<Todo> todos) => json.encode(
        todos.map<Map<String, dynamic>>((todo) => Todo.toMap(todo)).toList(),
      );

  Future<List<Todo>> decode(String todos) async =>
      (json.decode(todos) as List<dynamic>)
          .map<Todo>((item) => Todo.fromJson(item))
          .toList();
}
