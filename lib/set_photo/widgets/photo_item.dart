import 'package:flutter/material.dart';

import '../../todo_list/todo_list_screen.dart';

class PhotoItem extends StatelessWidget {
  const PhotoItem({
    super.key,
    required this.image,
    required this.setPhoto,
  });

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
        child: FittedBox(
          fit: BoxFit.cover,
          child: Image.network(image),
        ),
      ),
    );
  }
}
