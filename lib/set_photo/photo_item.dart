import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'image_dto_model.dart';
import 'image_result_model.dart';

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
          context.goNamed(
            '/',
            extra: true,
          );
          context.
        },
        child: Card(
          elevation: 5,
          child: FittedBox(
            fit: BoxFit.fill,
            child: Image.network(image),
          ),
        ),
      ),
    );
  }
}
