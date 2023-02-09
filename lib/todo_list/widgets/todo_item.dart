import 'package:flutter/material.dart';
import 'package:to_do_list/todo.dart';
import 'package:to_do_list/todo_details/detailed_task_screen.dart';
import 'package:to_do_list/todo_details/models/detailed_task_screen_args.dart';

import '../../set_photo/models/set_photo_screen_args.dart';
import '../../set_photo/set_photo_screen.dart';

class TodoItem extends StatelessWidget {
  TodoItem(
      {required this.todo,
      required this.onTodoChanged,
      required this.todoDelete,
      required this.deleteDoneTodoItem,
      required this.todoEdit})
      : super(key: ObjectKey(todo)) {
    nameTextFieldController.text = todo.name;
    descriptionTextFieldController.text = todo.description;
  }

  final Todo todo;
  final Function onTodoChanged;
  final Function todoDelete;
  final Function deleteDoneTodoItem;
  final Function todoEdit;

  final TextEditingController nameTextFieldController = TextEditingController();
  final TextEditingController descriptionTextFieldController =
      TextEditingController();

  TextStyle? _getTextStyle(bool checked) {
    if (!checked) return null;

    return const TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  TextStyle? _getTitleTextStyle(bool checked) {
    if (!checked) {
      return const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      );
    } else {
      return const TextStyle(
        color: Colors.black,
        decoration: TextDecoration.lineThrough,
        fontWeight: FontWeight.bold,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: GestureDetector(
        onTap: () {
          if (!todo.isEdit) {
            Navigator.of(context).pushNamed(
              DetailedTaskScreen.routeName,
              arguments: DetailedTaskScreenArgs(todoItemId: todo.id),
            );
          }
        },
        child: Card(
          elevation: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => {
                  Navigator.of(context).popAndPushNamed(
                    SetPhotoScreen.routeName,
                    arguments: SetPhotoScreenArgs(todoItemId: todo.id),
                  ),
                },
                child: Center(
                  child: Column(
                    children: [
                      if (todo.photo == null)
                        const Image(
                          image: AssetImage('assets/todo_icon.png'),
                          height: 60,
                        )
                      else
                        SizedBox(
                          width: double.infinity,
                          child: Image.network(
                            todo.photo!,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),


                      const SizedBox(
                        height: 15,
                      ),
                      if (todo.isEdit)
                        SizedBox(
                          height: 15,
                          child: TextField(
                            controller: nameTextFieldController,
                          ),
                        )
                      else
                        FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            todo.name,
                            style: _getTitleTextStyle(todo.checked),
                            overflow: TextOverflow.fade,
                            maxLines: 2,
                          ),
                        ),
                      const SizedBox(
                        height: 15,
                      ),
                      if (todo.isEdit)
                        SizedBox(
                          height: 15,
                          child: TextField(
                            controller: descriptionTextFieldController,
                          ),
                        )
                      else
                        FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            todo.description,
                            style: _getTextStyle(todo.checked),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Divider(
                    thickness: 0,
                    height: 0,
                    color: Colors.black,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        value: todo.checked,
                        onChanged: (bool? value) {
                          onTodoChanged(todo.id);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.edit, size: 16),
                        onPressed: () {
                          todoEdit(
                            todo.id,
                            nameTextFieldController.text,
                            descriptionTextFieldController.text,
                            !todo.isEdit,
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, size: 16),
                        onPressed: () {
                          if (todo.checked) {
                            deleteDoneTodoItem(todo.id);
                          } else {
                            todoDelete(todo.id);
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
