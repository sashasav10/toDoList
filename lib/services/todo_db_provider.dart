import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_list/todo.dart';

class TodoDbProvider {
  static TodoDbProvider of(context) => Provider.of(context, listen: false);
  static const _todoKey = "todoList";
  static const _todoHistoryKey = "todoHistoryList";

  Future<void> addTodoToSP(List<Todo> todos) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_todoKey, encode(todos));
  }

  Future<List<Todo>> getTodoFromSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? todoString = prefs.getString(_todoKey);
    if (todoString == null) return [];
    return await decode(todoString);
  }

  void addHistoryTodoToSP(List<Todo> todos) async {
    SharedPreferences prefsHistory = await SharedPreferences.getInstance();
    prefsHistory.setString(_todoHistoryKey, encode(todos));
  }

  Future<List<Todo>> getHistoryTodoFromSF() async {
    SharedPreferences prefsHistory = await SharedPreferences.getInstance();
    String? todoHistoryString = prefsHistory.getString(_todoHistoryKey);
    if (todoHistoryString == null) return [];
    return await decode(todoHistoryString);
  }

  String encode(List<Todo> todos) => json.encode(
        todos.map<Map<String, dynamic>>((todo) => Todo.toMap(todo)).toList(),
      );

  Future<List<Todo>> decode(String todos) async =>
      (json.decode(todos) as List<dynamic>)
          .map<Todo>((item) => Todo.fromJson(item))
          .toList();
}
