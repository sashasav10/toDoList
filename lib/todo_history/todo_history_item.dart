import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_list/todo.dart';

class TodoHistoryItem extends StatelessWidget {
  TodoHistoryItem({
    required this.todo,
  }) : super(key: ObjectKey(todo)) {
    nameTextFieldController.text = todo.name;
    descriptionTextFieldController.text = todo.description;
  }

  final Todo todo;

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
      child: Container(
        width: MediaQuery.of(context).size.width / 2.1,
        height: MediaQuery.of(context).size.height / 5,
        color: Colors.black26,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (todo.isEdit)
                TextField(controller: nameTextFieldController)
              else
                Text(
                  todo.name,
                  style: _getTextStyle(todo.checked),
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
        ),
      ),
    );
  }
}
