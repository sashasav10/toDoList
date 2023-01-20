import 'dart:async';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:to_do_list/todo_list/store/todo_list_store.dart';
import 'package:to_do_list/todo_list/todo_item.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final _formKeyValidate = GlobalKey<FormState>();

  @override
  void initState() {
    TodoStore.of(context).init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              context.goNamed(
                'todo_history_list',
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
                _displayAddDialog(TodoStore.of(context).addTodoItem);
              },
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.all(16),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 1.5),
              crossAxisCount: 2,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
            ),
            itemCount: TodoStore.of(context).todos.length,
            itemBuilder: (context, index) => TodoItem(
              todo: TodoStore.of(context).todos[index],
              onTodoChanged: TodoStore.of(context).handleTodoChange,
              todoDelete: TodoStore.of(context).deleteTodoItem,
              deleteDoneTodoItems: TodoStore.of(context).deleteDoneTodoItems,
              todoEdit: TodoStore.of(context).editTodoItem,
            ),
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _displayAddDialog(TodoStore.of(context).addTodoItem),
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _displayAddDialog(
    Function(String title, String description) onCreate,
  ) async {
    final TextEditingController nameTextFieldController =
        TextEditingController();
    final TextEditingController descriptionTextFieldController =
        TextEditingController();

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add a new todo item'),
          content: Form(
            key: _formKeyValidate,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: nameTextFieldController,
                  decoration: const InputDecoration(
                    hintText: 'Type name of new todo',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: descriptionTextFieldController,
                  decoration:
                      const InputDecoration(hintText: 'Type description'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                if (_formKeyValidate.currentState!.validate()) {
                  Navigator.of(context).pop();
                  onCreate(
                    nameTextFieldController.text,
                    descriptionTextFieldController.text,
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }
}
