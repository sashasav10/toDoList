import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/store/todo_list_store.dart';
import 'package:to_do_list/todoList.dart';
import 'package:to_do_list/todo_db_service.dart';
import 'package:uuid/uuid.dart';

import 'detailed_task_screen.dart';

void main() => runApp(const TodoApp());

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const TodoList();
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
);

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Uuid>(create: (context) => const Uuid()),
        Provider<TodoDbService>(create: (context) => TodoDbService()),
        Provider<TodoStore>(
          create: (context) => TodoStore(
            uuid: Provider.of<Uuid>(context, listen: false),
            todoDbService: TodoDbService.of(context),
          ),
        ),
      ],
      child: Builder(
        builder: (context) {
          return MaterialApp.router(
            routerConfig: _router,
            theme: ThemeData(
              primarySwatch: Colors.red,
            ),
          );
        },
      ),
    );
  }
}
