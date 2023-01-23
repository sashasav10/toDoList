import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/services/image_api_service.dart';
import 'package:to_do_list/services/todo_db_service.dart';
import 'package:to_do_list/set_photo/set_photo_screen.dart';
import 'package:to_do_list/set_photo/store/image_store.dart';
import 'package:to_do_list/todo_details/store/detailed_task_store.dart';
import 'package:to_do_list/todo_history/store/todo_history_list_store.dart';
import 'package:to_do_list/todo_history/todo_history_screen.dart';
import 'package:to_do_list/todo_list/store/todo_list_store.dart';
import 'package:to_do_list/todo_list/todo_list_screen.dart';
import 'package:uuid/uuid.dart';

import 'todo_details/detailed_task_screen.dart';

void main() => runApp(const TodoApp());

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Uuid>(create: (context) => const Uuid()),
        Provider<TodoDbService>(create: (context) => TodoDbService()),
        Provider<ImageApiService>(create: (context) => ImageApiService()),
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
              routes: [
                GoRoute(
                  name: 'detailed_task_screen',
                  path: 'detailed_task_screen',
                  builder: (BuildContext context, GoRouterState state) {
                    //  String index = state.extra as String;
                    final todoItemId = state.queryParams["id"];
                    return Provider(
                      create: (context) => DetailedTaskStore(
                        todoDbService: TodoDbService.of(context),
                        id: todoItemId!,
                      ),
                      child: DetailedTaskScreen(),
                    );
                  },
                ),
                GoRoute(
                  name: 'todo_history_list',
                  path: 'todo_history_list',
                  builder: (BuildContext context, GoRouterState state) {
                    return Provider(
                      create: (context) => TodoHistoryStore(
                        todoDbService: TodoDbService.of(context),
                      ),
                      child: const TodoHistoryList(),
                    );
                  },
                ),
                GoRoute(
                  name: 'set_photo_screen',
                  path: 'set_photo_screen',
                  builder: (BuildContext context, GoRouterState state) {
                    return Provider(
                      create: (context) => ImageStore(
                        imageApiService: ImageApiService.of(context),
                      ),
                      child: const SetPhotoScreen(),
                    );
                  },
                ),
              ],
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
