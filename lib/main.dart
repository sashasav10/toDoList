import 'package:flutter/material.dart';
import 'package:to_do_list/global_provider.dart';
import 'package:to_do_list/routes.dart';
import 'package:to_do_list/todo_list/todo_list_screen.dart';

void main() => runApp(
      const GlobalsProvider(
        child: TodoApp(),
      ),
    );

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: TodoList.routeName,
      onGenerateRoute: (settings) => generateRoute(context, settings),
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
    );
  }
}
