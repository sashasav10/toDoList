import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Card(
        elevation: 5,
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
                    overflow: TextOverflow.fade,
                    maxLines: 2,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                const SizedBox(
                  height: 10,
                ),
                if (todo.isEdit)
                  TextField(controller: descriptionTextFieldController)
                else
                  Text(
                    todo.description,
                    overflow: TextOverflow.fade,
                    maxLines: 4,
                  ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 40.0),
              child: Divider(
                thickness: 0,
                height: 0,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
