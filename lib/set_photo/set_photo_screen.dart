import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:to_do_list/set_photo/photo_item.dart';
import 'package:to_do_list/set_photo/store/image_store.dart';

import '../todo_details/store/detailed_task_store.dart';
import 'image_result_model.dart';

class SetPhotoScreen extends StatefulWidget {
  const SetPhotoScreen({super.key});

  @override
  _SetPhotoScreenState createState() => _SetPhotoScreenState();
}

class _SetPhotoScreenState extends State<SetPhotoScreen> {
  final TextEditingController searchFieldController = TextEditingController();
  // Future<ImageResult> getImages() async {
  //   Dio dio = Dio();
  //   Response<dynamic> response = await dio.get(
  //       "https://bing-image-search1.p.rapidapi.com/images/search?q=person",
  //       options: Options(
  //         headers: {
  //           "X-RapidAPI-Key":
  //               "b1a7f67b18msh424b6cb334a03c7p1396e6jsna22b094ae39b",
  //           "X-RapidAPI-Host": "bing-image-search1.p.rapidapi.com"
  //         },
  //       ));
  //   return ImageResult.fromJson(response.data);
  // }

  @override
  void initState() {
    super.initState();
    ImageStore.of(context).init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Set photo'),
        leading: GestureDetector(
          onTap: () {
            context.goNamed(
              '/',
              queryParams: {"updateNeed": "true"},
            );
          },
          child: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: Observer(
        builder: (_) {
          final images = ImageStore.of(context).images;
          if (images == null) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: searchFieldController,
                        decoration: const InputDecoration(
                            hintText: 'Search photo for icon'),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.search),
                      iconSize: 40,
                      onPressed: () {
                        ImageStore.of(context)
                            .searchByPressedButton(searchFieldController.text);
                      },
                    ),
                  ],
                ),
                const Text("No images have found, please search another one"),
              ],
            );
          }

          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: searchFieldController,
                      decoration: const InputDecoration(
                          hintText: 'Search photo for icon'),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.search),
                    iconSize: 40,
                    onPressed: () {
                      ImageStore.of(context)
                          .searchByPressedButton(searchFieldController.text);
                    },
                  )
                ],
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 2),
                    crossAxisCount: 2,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                  ),
                  itemCount: images.value.length,
                  itemBuilder: (context, index) => PhotoItem(
                    image: images.value[index].contentUrl,
                    setPhoto: ImageStore.of(context).setPhoto,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
