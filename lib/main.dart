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

    //       .router(
    //     routerConfig: GoRouter(
    //       initialLocation: '/',
    //       routes: <RouteBase>[
    //         GoRoute(
    //           name: '/',
    //           path: '/',
    //           builder: (BuildContext context, GoRouterState state) {
    //             return Provider(
    //               create: (context) => TodoStore(
    //                 uuid: Provider.of<Uuid>(context, listen: false),
    //                 todoDbService: TodoDbService.of(context),
    //               ),
    //               child: const TodoList(),
    //             );
    //           },
    //           routes: [
    //             GoRoute(
    //               name: 'todo_history_list',
    //               path: 'todo_history_list',
    //               builder: (BuildContext context, GoRouterState state) {
    //                 return Provider(
    //                   create: (context) => TodoHistoryStore(
    //                     todoDbService: TodoDbService.of(context),
    //                   ),
    //                   child: const TodoHistoryList(),
    //                 );
    //               },
    //             ),
    //           ],
    //         ),
    //         GoRoute(
    //           name: 'detailed_task_screen',
    //           path: '/detailed_task_screen',
    //           builder: (BuildContext context, GoRouterState state) {
    //             //  String index = state.extra as String;
    //             final todoItemId = state.queryParams["id"];
    //             return Provider(
    //               create: (context) => DetailedTaskStore(
    //                 todoDbService: TodoDbService.of(context),
    //                 id: todoItemId!,
    //               ),
    //               child: DetailedTaskScreen(),
    //             );
    //           },
    //         ),
    //         GoRoute(
    //           name: 'set_photo_screen',
    //           path: '/set_photo_screen',
    //           builder: (BuildContext context, GoRouterState state) {
    //             final todoItemId = state.queryParams["id"];
    //             return Provider(
    //               create: (context) => ImageStore(
    //                 imageApiService: ImageApiService.of(context),
    //                 todoId: todoItemId!,
    //                 todoDbService: TodoDbService.of(context),
    //               ),
    //               child: const SetPhotoScreen(),
    //             );
    //           },
    //         ),
    //       ],
    //     ),
    //     theme: ThemeData(
    //       primarySwatch: Colors.red,
    //     ),
    //   ),
    // );
  }
}
