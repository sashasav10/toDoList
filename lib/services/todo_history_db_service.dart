import 'dart:convert';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_list/todo.dart';

class TodoHistoryDbService {
  static TodoHistoryDbService of(context) =>
      Provider.of(context, listen: false);
  static const _todoHistoryKey = "todoHistoryList";

  void addTodoToSP(List<Todo> todos) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_todoHistoryKey, encode(todos));
  }

  Future<List<Todo>> getTodoFromSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? todoString = prefs.getString(_todoHistoryKey);
    if (todoString == null) return [];
    return await decode(todoString);
  }

  String encode(List<Todo> todos) => json.encode(
        todos.map<Map<String, dynamic>>((todo) => Todo.toMap(todo)).toList(),
      );

  Future<List<Todo>> decode(String todos) async =>
      (json.decode(todos) as List<dynamic>)
          .map<Todo>((item) => Todo.fromJson(item))
          .toList();
}
