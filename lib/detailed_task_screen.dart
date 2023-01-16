import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import 'package:to_do_list/store/detailed_task_store.dart';
import 'package:to_do_list/todo_db_service.dart';
import 'package:uuid/uuid.dart';

class DetailedTaskScreen extends StatefulWidget {
  DetailedTaskScreen({super.key, String? id});
  String? id;

  @override
  _DetailedTaskScreen createState() => _DetailedTaskScreen();
}

class _DetailedTaskScreen extends State<DetailedTaskScreen> {
  // _DetailedTaskScreen({required this.id});
  // @observable
  // final id;
  late final _detailedStore;

  @override
  void initState() {
    TodoDbService todoDbService = TodoDbService.of(context);
    _detailedStore =
        DetailedTask(uuid: const Uuid(), todoDbService: todoDbService);
    _detailedStore.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do List'),
        leading: GestureDetector(
          onTap: () => context.go('/'),
          child: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: Observer(
        builder: (_) => Column(
          children: [
            //Text(_detailedStore.todos[id].name),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('mark as ready'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('edit'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('delete'),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
