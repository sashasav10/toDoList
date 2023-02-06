import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list/global_provider.dart';
import 'package:to_do_list/routes.dart';
import 'package:to_do_list/todo.dart';
import 'package:to_do_list/todo_list/todo_list_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter());
  await Hive.openBox<Todo>("todoBox");
  runApp(
    const GlobalsProvider(
      child: TodoApp(),
    ),
  );
}

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
