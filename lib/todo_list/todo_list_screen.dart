import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/provider/todo_db_provider.dart';
import 'package:to_do_list/todo_history/todo_history_screen.dart';
import 'package:to_do_list/todo_list/store/todo_list_store.dart';
import 'package:to_do_list/todo_list/widgets/todo_item.dart';
import 'package:uuid/uuid.dart';

import '../services/todo_service.dart';
import 'widgets/alert_dialog.dart';

class TodoList extends StatelessWidget {
  TodoList({super.key});
  static const routeName = 'todo-list';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => TodoStore(
            uuid: Provider.of<Uuid>(context, listen: false),
            todoDbService: TodoDbService.of(context),
          ),
        ),
      ],
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          title: const Text('To Do List'),
          leading: GestureDetector(
            onTap: () {
              TodoStore.of(context).deleteDoneTodoItems();
            },
            child: const Icon(
              Icons.auto_delete_outlined,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.history),
              tooltip: 'Show history',
              onPressed: () {
                Navigator.of(context).pushNamed(
                  TodoHistoryList.routeName,
                );
              },
            ),
          ],
        ),
        body: Observer(builder: (_) {
          if (TodoStore.of(context).todos.isEmpty) {
            return Center(
              child: IconButton(
                icon: const Icon(Icons.hourglass_empty, size: 45),
                onPressed: () {
                  AddAlertDialog().displayAddDialog(
                    TodoStore.of(context).addTodoItem,
                    context,
                  );
                },
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(16),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.55),
                crossAxisCount: 2,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
              ),
              itemCount: TodoStore.of(context).todos.length,
              itemBuilder: (context, index) => TodoItem(
                todo: TodoStore.of(context).todos[index],
                onTodoChanged: TodoStore.of(context).markAsDone,
                todoDelete: TodoStore.of(context).deleteTodoItem,
                deleteDoneTodoItem: TodoStore.of(context).deleteDoneTodoItem,
                todoEdit: TodoStore.of(context).editTodoItem,
              ),
            ),
          );
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: () => AddAlertDialog().displayAddDialog(
            TodoStore.of(context).addTodoItem,
            context,
          ),
          tooltip: 'Add Task',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
