import 'package:flutter/material.dart';

class AddAlertDialog {
  final _formKeyValidate = GlobalKey<FormState>();

  Future<void> displayAddDialog(
    Function(String title, String description) onCreate,
    BuildContext context,
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
