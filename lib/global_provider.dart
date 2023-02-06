import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/services/todo_service.dart';
import 'package:to_do_list/set_photo/provider/image_api_provider.dart';
import 'package:to_do_list/set_photo/service/image_api_service.dart';
import 'package:to_do_list/services/todo_db_provider.dart';
import 'package:to_do_list/todo.dart';
import 'package:uuid/uuid.dart';

class GlobalsProvider extends StatefulWidget {
  const GlobalsProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  _GlobalsProviderState createState() => _GlobalsProviderState();
}

class _GlobalsProviderState extends State<GlobalsProvider> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Hive.openBox<Todo>("todoBox"),
      builder: (context, snapshot) => snapshot.hasData
          ? MultiProvider(
              providers: [
                Provider<Uuid>(create: (context) => const Uuid()),
                Provider<TodoDbProvider>(
                    create: (context) =>
                        TodoDbProvider(todoBox: snapshot.data!)),
                Provider<TodoDbService>(
                    create: (context) => TodoDbService(
                        todoDbProvider:
                            TodoDbProvider(todoBox: snapshot.data!))),
                Provider<ImageApiService>(
                    create: (context) =>
                        ImageApiService(apiProvider: ImageApiProvider())),
              ],
              child: widget.child,
            )
          : const SizedBox.shrink(),
    );
  }
}
