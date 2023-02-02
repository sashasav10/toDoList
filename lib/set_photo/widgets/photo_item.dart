import 'package:flutter/material.dart';

import '../../todo_list/todo_list_screen.dart';

class PhotoItem extends StatelessWidget {
  PhotoItem({
    required this.image,
    required this.setPhoto,
  }) : super(key: ObjectKey(image)) {}

  final String image;
  final Function setPhoto;
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: GestureDetector(
        onTap: () {
          setPhoto(image);
          Navigator.of(context).popAndPushNamed(
            TodoList.routeName,
          );
        },
        child: Card(
          elevation: 5,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Image.network(image),
          ),
        ),
      ),
    );
  }
}
