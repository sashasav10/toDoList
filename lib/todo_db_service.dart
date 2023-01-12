import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_list/toDo.dart';

class TodoDbService{
  void addTodoToSP(List<Todo> _todos) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("todoList", encode(_todos));
  }

  getTodoFromSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? todoString = prefs.getString("todoList");
    return await decode(todoString!);
  }

  String encode(List<Todo> todos) => json.encode(
    todos
        .map<Map<String, dynamic>>((todo) => TodoDbService.toMap(todo))
        .toList(),
  );

  Future<List<Todo>> decode(String todos) async =>
      (json.decode(todos) as List<dynamic>)
          .map<Todo>((item) => TodoDbService.fromJson(item))
          .toList();

  static fromJson(Map<String, dynamic> jsonData) {
    return Todo(
      id: jsonData['id'],
      name: jsonData['name'],
      checked: jsonData['checked'],
      isEdit: jsonData['isEdit'],
    );
  }

  static Map<String, dynamic> toMap(Todo todo) => {
    'id': todo.id,
    'name': todo.name,
    'checked': todo.checked,
    'isEdit': todo.isEdit,
  };
}
