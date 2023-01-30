import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/services/todo_db_service.dart';
import 'package:to_do_list/todo_details/models/detailed_task_screen_args.dart';
import 'package:to_do_list/todo_details/store/detailed_task_store.dart';

import '../todo_list/todo_list_screen.dart';

class DetailedTaskScreen extends StatelessWidget {
  DetailedTaskScreen({super.key, required this.args});
  static const routeName = 'detailed-task-screen';

  final DetailedTaskScreenArgs args;
  final TextEditingController nameTextFieldController = TextEditingController();
  final TextEditingController descriptionTextFieldController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => DetailedTaskStore(
        todoDbService: TodoDbService.of(context),
        id: args.todoItemId,
      ),
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          title: Text("todo.name"),
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).popAndPushNamed(
                TodoList.routeName,
              );
            },
            child: const Icon(
              Icons.arrow_back,
            ),
          ),
        ),
        body: Observer(
          builder: (_) {
            final todoItem = DetailedTaskStore.of(context).todoItem;
            final isLoading = DetailedTaskStore.of(context).isLoading;
            if (isLoading || todoItem == null) {
              return const Center(child: CircularProgressIndicator());
            }

            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (todoItem.isEdit)
                          TextField(controller: nameTextFieldController)
                        else
                          Text(
                            todoItem.name,
                            style: _getTextStyle(todoItem.checked),
                          ),
                        if (todoItem.isEdit)
                          TextField(controller: descriptionTextFieldController)
                        else
                          Text(
                            todoItem.description,
                            style: _getTextStyle(todoItem.checked),
                          ),
                      ]),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            DetailedTaskStore.of(context).changeAsMarked();
                          },
                          child: const Text(
                            'mark as ready',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            DetailedTaskStore.of(context).editTodoItem(
                                nameTextFieldController.text,
                                descriptionTextFieldController.text,
                                !todoItem.isEdit);
                          },
                          child: const Text('edit'),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            DetailedTaskStore.of(context).deleteTodoItem();
                            Navigator.of(context).popAndPushNamed(
                              TodoList.routeName,
                            );
                          },
                          child: const Text('delete'),
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          },
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
