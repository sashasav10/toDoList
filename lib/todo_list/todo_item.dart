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

  @override
  Widget build(BuildContext context) {
    final id = todo.id;
    return IntrinsicHeight(
      child: GestureDetector(
        onTap: () => context.goNamed(
          'detailed_task_screen',
          queryParams: {"id": id},
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            Checkbox(
              checkColor: Colors.white,
              value: todo.checked,
              onChanged: (bool? value) {
                onTodoChanged(todo);
              },
            ),
            Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (todo.isEdit)
                      Expanded(
                          child: TextField(controller: nameTextFieldController))
                    else
                      Expanded(
                        child: Text(
                          todo.name,
                          style: _getTextStyle(todo.checked),
                        ),
                      ),
                    if (todo.isEdit)
                      Expanded(
                          child: TextField(
                              controller: descriptionTextFieldController))
                    else
                      Expanded(
                        child: Text(
                          todo.description,
                          style: _getTextStyle(todo.checked),
                        ),
                      ),
                  ]),
            ),
            IconButton(
              icon: const Icon(Icons.account_balance_wallet, size: 16),
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
          ]),
        ),
      ),
    );
  }
}
