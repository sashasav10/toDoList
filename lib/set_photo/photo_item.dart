import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'image_dto_model.dart';
import 'image_result_model.dart';

class PhotoItem extends StatelessWidget {
  PhotoItem({
    required this.image,
  }) : super(key: ObjectKey(image)) {}

  final String image;
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Card(
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [Text(image)],
        ),
      ),
    );
  }
}
