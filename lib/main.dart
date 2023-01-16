import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/store/todo_list_store.dart';
import 'package:to_do_list/todoList.dart';
import 'package:to_do_list/todo_db_service.dart';
import 'package:uuid/uuid.dart';

import 'detailed_task_screen.dart';

void main() => runApp(const TodoApp());

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Uuid>(create: (context) => const Uuid()),
        Provider<TodoDbService>(create: (context) => TodoDbService()),
      ],
      builder: (context, child) => MaterialApp.router(
        routerConfig: GoRouter(
          initialLocation: '/',
          routes: <RouteBase>[
            GoRoute(
              path: '/',
              builder: (BuildContext context, GoRouterState state) {
                return Provider(
                  create: (context) => TodoStore(
                    uuid: Provider.of<Uuid>(context, listen: false),
                    todoDbService: TodoDbService.of(context),
                  ),
                  child: const TodoList(),
                );
              },
            ),
            GoRoute(
              path: '/detailed_task_screen',
              builder: (BuildContext context, GoRouterState state) {
                //  String index = state.extra as String;
                return DetailedTaskScreen(id: "0");
              },
            ),
          ],
        ),
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
      ),
    );
  }
}
