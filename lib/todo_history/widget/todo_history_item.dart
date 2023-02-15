import 'package:flutter/material.dart';
import 'package:to_do_list/todo.dart';

class TodoHistoryItem extends StatelessWidget {
  TodoHistoryItem({
    required this.todo,
  }) : super(key: ObjectKey(todo));

  final Todo todo;

  TextStyle? _getTitleTextStyle() {
    return const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Card(
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Column(
                children: [
                  if (todo.photo == null)
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Image(
                        image: AssetImage('assets/todo_icon.png'),
                        height: 60,
                      ),
                    )
                  else
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Image.network(
                        todo.photo!,
                        height: 100,
                      ),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    todo.name,
                    style: _getTitleTextStyle(),
                    overflow: TextOverflow.fade,
                    maxLines: 2,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    todo.description,
                    overflow: TextOverflow.fade,
                    maxLines: 4,
                  ),
                ],
              ),
            ),
            Column(
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
                      onChanged: null,
                    ),
                    const IconButton(
                      icon: Icon(Icons.edit, size: 16),
                      onPressed: null,
                    ),
                    const IconButton(
                      icon: Icon(Icons.delete, size: 16),
                      onPressed: null,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
