import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_list/todo.dart';

class TodoItem extends StatelessWidget {
  TodoItem(
      {required this.todo,
      required this.onTodoChanged,
      required this.todoDelete,
      required this.todoEdit})
      : super(key: ObjectKey(todo)) {
    nameTextFieldController.text = todo.name;
    descriptionTextFieldController.text = todo.description;
  }

  final Todo todo;
  final Function onTodoChanged;
  final Function todoDelete;
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
    final id = todo.id;
    return IntrinsicHeight(
      child: GestureDetector(
        onTap: () => context.goNamed(
          'detailed_task_screen',
          queryParams: {"id": id},
        ),
        child: Container(
          width: MediaQuery.of(context).size.width / 2.1,
          height: MediaQuery.of(context).size.height / 5,
          color: Colors.black12,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    if (todo.isEdit)
                      TextField(controller: nameTextFieldController)
                    else
                      Text(
                        todo.name,
                        style: _getTitleTextStyle(todo.checked),
                      ),
                    const SizedBox(
                      height: 10,
                    ),
                    if (todo.isEdit)
                      TextField(controller: descriptionTextFieldController)
                    else
                      Text(
                        todo.description,
                        style: _getTextStyle(todo.checked),
                      ),
                  ],
                ),
                Column(
                  children: [
                    const Divider(
                      thickness: 2,
                      color: Colors.black,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          value: todo.checked,
                          onChanged: (bool? value) {
                            onTodoChanged(todo);
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.account_balance_wallet,
                              size: 16),
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
                            todoDelete(todo.id);
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
      ),
    );
  }
}
