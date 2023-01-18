import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import 'package:to_do_list/todo_details/detailed_task_store.dart';

import '../todo.dart';

class DetailedTaskScreen extends StatefulWidget {
  DetailedTaskScreen({super.key});

  @override
  _DetailedTaskScreen createState() => _DetailedTaskScreen();
}

class _DetailedTaskScreen extends State<DetailedTaskScreen> {
  final TextEditingController nameTextFieldController = TextEditingController();
  final TextEditingController descriptionTextFieldController =
      TextEditingController();
  late Todo todoItem;
  @override
  void initState() {
    DetailedTaskStore.of(context).init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (DetailedTaskStore.of(context).todoItem != null) {
      todoItem = DetailedTaskStore.of(context).todoItem!;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("todo.name"),
        leading: GestureDetector(
          onTap: () => context.go('/'),
          child: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: Observer(
        // todoItem= DetailedTaskStore.of(context).todoItem;
        builder: (_) => Column(
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (DetailedTaskStore.of(context).todoItem!.isEdit)
                    TextField(controller: nameTextFieldController)
                  else
                    Text(
                      DetailedTaskStore.of(context).todoItem!.name,
                      style: _getTextStyle(
                          DetailedTaskStore.of(context).todoItem!.checked),
                    ),
                  if (DetailedTaskStore.of(context).todoItem!.isEdit)
                    TextField(controller: descriptionTextFieldController)
                  else
                    Text(
                      DetailedTaskStore.of(context).todoItem!.description,
                      style: _getTextStyle(
                          DetailedTaskStore.of(context).todoItem!.checked),
                    ),
                ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      DetailedTaskStore.of(context).handleTodoChange();
                    },
                    child: const Text('mark as ready'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      DetailedTaskStore.of(context).editTodoItem(
                          nameTextFieldController.text,
                          descriptionTextFieldController.text,
                          !DetailedTaskStore.of(context).todoItem!.isEdit);
                    },
                    child: const Text('edit'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      context.go('/');
                      DetailedTaskStore.of(context).deleteTodoItem();
                    },
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

  TextStyle? _getTextStyle(bool checked) {
    if (!checked) return null;

    return const TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }
}
