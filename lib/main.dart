import 'package:flutter/material.dart';
import 'package:to_do_list/todoList.dart';
void main() => runApp(const TodoApp());

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



