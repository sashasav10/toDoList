import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/todoList.dart';
import 'package:to_do_list/todo_db_service.dart';

void main() => runApp(
      Provider<TodoDbService>(
        create: (_) => TodoDbService(),
        child: const TodoApp(),
      ),
    );

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const TodoList(),
    );
  }
}
