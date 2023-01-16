import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import 'package:to_do_list/store/detailed_task_store.dart';

class DetailedTaskScreen extends StatefulWidget {
  DetailedTaskScreen({super.key, this.id});
  String? id;

  @override
  _DetailedTaskScreen createState() => _DetailedTaskScreen(id: id);
}

class _DetailedTaskScreen extends State<DetailedTaskScreen> {
  _DetailedTaskScreen({required this.id}) {
    // nameTextFieldController.text =
    //     DetailedTaskStore.of(context).getToDoById(id).name;
    // descriptionTextFieldController.text =
    //     DetailedTaskStore.of(context).getToDoById(id).description;
  }
  @observable
  final id;
  final TextEditingController nameTextFieldController = TextEditingController();
  final TextEditingController descriptionTextFieldController =
      TextEditingController();
  @override
  void initState() {
    DetailedTaskStore.of(context).init();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Todo todo = DetailedTaskStore.of(context).getToDoById(id);
    return Scaffold(
      appBar: AppBar(
        title: Text("todo.name"),
        leading: GestureDetector(
          onTap: () => context.go('/'),
          child: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: Observer(
        builder: (_) => Column(
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (DetailedTaskStore.of(context).getToDoById(id).isEdit)
                    TextField(controller: nameTextFieldController)
                  else
                    Text(
                      DetailedTaskStore.of(context).getToDoById(id).name,
                      style: _getTextStyle(DetailedTaskStore.of(context)
                          .getToDoById(id)
                          .checked),
                    ),
                  if (DetailedTaskStore.of(context).getToDoById(id).isEdit)
                    TextField(controller: descriptionTextFieldController)
                  else
                    Text(
                      DetailedTaskStore.of(context).getToDoById(id).description,
                      style: _getTextStyle(DetailedTaskStore.of(context)
                          .getToDoById(id)
                          .checked),
                    ),
                ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      DetailedTaskStore.of(context).handleTodoChange(
                          DetailedTaskStore.of(context).getToDoById(id));
                    },
                    child: const Text('mark as ready'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      DetailedTaskStore.of(context).editTodoItem(
                          id,
                          nameTextFieldController.text,
                          descriptionTextFieldController.text,
                          !DetailedTaskStore.of(context)
                              .getToDoById(id)
                              .isEdit);
                    },
                    child: const Text('edit'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      context.go('/');
                      DetailedTaskStore.of(context).deleteTodoItem(id);
                    },
                    child: const Text('delete'),
                  ),
                )
              ],
            )
          ],
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
