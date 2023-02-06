import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_list/todo.dart';

class TodoDbProvider {
  static TodoDbProvider of(context) => Provider.of(context, listen: false);
  static const _todoBox = "todoBox";

  Future<void> addTodo(Todo todo) async {
    final box = Hive.box<Todo>(_todoBox);
    await box.put(todo.id, todo);
  }

  Future<void> updateTodo(int index, Todo todo) async {
    final box = Hive.box<Todo>(_todoBox);
    box.putAt(index, todo);
  }

  Future<List<Todo>> getTodos() async {
    final box = Hive.box<Todo>(_todoBox);
    List<Todo> todos = box.values.toList();
    return todos;
  }

  Future<void> deleteTodo(int index) async {
    final box = Hive.box<Todo>(_todoBox);
    box.deleteAt(index);
  }

  deleteHistoryTodoItems(List keys) {
    final box = Hive.box<Todo>(_todoBox);
    box.deleteAll(keys);
  }

  String encode(List<Todo> todos) => json.encode(
        todos.map<Map<String, dynamic>>((todo) => Todo.toMap(todo)).toList(),
      );

  Future<List<Todo>> decode(String todos) async =>
      (json.decode(todos) as List<dynamic>)
          .map<Todo>((item) => Todo.fromJson(item))
          .toList();
}
