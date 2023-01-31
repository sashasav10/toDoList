import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/set_photo/service/image_api_service.dart';
import 'package:to_do_list/services/todo_db_service.dart';
import 'package:uuid/uuid.dart';

import 'api/api_client.dart';

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
    return MultiProvider(
      providers: [
        Provider<Uuid>(create: (context) => const Uuid()),
        Provider<TodoDbService>(create: (context) => TodoDbService()),
        Provider<ImageApiService>(create: (context) => ImageApiService()),
      ],
      child: widget.child,
    );
  }
}
