import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/set_photo/widgets/photo_item.dart';
import 'package:to_do_list/set_photo/store/image_store.dart';

import '../services/todo_service.dart';
import 'service/image_api_service.dart';
import '../todo_list/todo_list_screen.dart';
import 'models/set_photo_screen_args.dart';

class SetPhotoScreen extends StatefulWidget {
  const SetPhotoScreen({super.key, required this.args});
  final SetPhotoScreenArgs args;
  @override
  _SetPhotoScreenState createState() => _SetPhotoScreenState(args: args);
  static const routeName = 'set-photo-screen';
}

class _SetPhotoScreenState extends State<SetPhotoScreen> {
  _SetPhotoScreenState({required this.args});
  final SetPhotoScreenArgs args;
  final TextEditingController searchFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => ImageStore(
          imageApiService: ImageApiService.of(context),
          todoId: args.todoItemId,
          todoDbService: TodoDbService.of(context)),
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Set photo'),
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).popAndPushNamed(
                TodoList.routeName,
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
            if (images == null || images.isEmpty) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: searchFieldController,
                            decoration: InputDecoration(
                              hintText: 'Search photo for icon',
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.red,
                                ),
                              ),
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.search),
                                color: Colors.red,
                                onPressed: () {
                                  ImageStore.of(context).searchByPressedButton(
                                      searchFieldController.text);
                                },
                              ),
                            ),
                          ),
                        ),
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
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: searchFieldController,
                          decoration: InputDecoration(
                            hintText: 'Search photo for icon',
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.search),
                              color: Colors.red,
                              onPressed: () {
                                ImageStore.of(context).searchByPressedButton(
                                    searchFieldController.text);
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    controller: ImageStore.of(context).scrollController,
                    itemCount: images.length,
                    itemBuilder: (context, index) => PhotoItem(
                        image: images[index].url!,
                        setPhoto: ImageStore.of(context).setPhoto),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
