import 'package:flutter/material.dart';
import 'package:to_do_list/toDo.dart';

class TodoItem extends StatelessWidget {
  TodoItem(
      {required this.id,
      required this.todo,
      required this.onTodoChanged,
      required this.todoDelete,
      required this.todoEdit})
      : super(key: ObjectKey(todo)) {
    textFieldController.text = todo.name;
  }

  final id;
  Todo todo;
  final onTodoChanged;
  final todoDelete;
  final todoEdit;

  final TextEditingController textFieldController = TextEditingController();

  TextStyle? _getTextStyle(bool checked) {
    if (!checked) return null;

    return const TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(children: [
         Checkbox(
          checkColor: Colors.black,
          value: todo.checked,
          onChanged: (bool? value) {
            onTodoChanged(todo);
          },
        ),
        if (todo.isEdit)
          Expanded(child: TextField(controller: textFieldController))
        else
          Expanded(
            child: Text(
              todo.name,
              style: _getTextStyle(todo.checked),
            ),
          ),
        IconButton(
          icon: const Icon(Icons.account_balance_wallet, size: 16),
          onPressed: () {
           todoEdit(todo.id,textFieldController.text,!todo.isEdit);
          },
        ),
        IconButton(
          icon: const Icon(Icons.delete, size: 16),
          onPressed: () {
            todoDelete(todo.id);
          },
        ),
      ]),
    );
  }
}
