import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import '../../services/todo_service.dart';
import '../service/image_api_service.dart';
import '../../todo.dart';
import '../models/image_result_model.dart';

part 'image_store.g.dart';

class ImageStore extends _ImageStore with _$ImageStore {
  ImageStore({
    required super.imageApiService,
    required super.todoId,
    required super.todoDbService,
  });

  static ImageStore of(context) => Provider.of(context, listen: false);
}

abstract class _ImageStore with Store {
  _ImageStore(
      {required this.imageApiService,
      required this.todoId,
      required this.todoDbService}) {
    init();
  }

  var todoItem;
  final ImageApiService imageApiService;
  final String todoId;
  final TodoDbService todoDbService;
  @observable
  ObservableList<Value> _images = ObservableList();
  ObservableList<Value>? get images => _images;
  int page = 1;
  final ObservableList<Todo> _todos = ObservableList<Todo>();
  final scrollController = ScrollController();

  @action
  Future<void> init() async {
    page = 1;
    final todoList = await todoDbService.getTodo();
    _todos.addAll(todoList);
    todoItem = _getToDoById(todoId);
    final newList = await imageApiService.getImages(todoItem.name, page);
    _images.addAll(newList);
    scrollController.addListener(() {});
  }

  onScroll() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      searchNextPage("");
      print("Спрацював пагінатор");
    }
  }

  searchByPressedButton(searchText) async {
    _images = await imageApiService.getImages(searchText, page);
  }

  searchNextPage(searchText) async {
    page++;
    _images = await imageApiService.getImages(searchText, page);
  }

  @action
  Future<void> setPhoto(String photo) async {
    await todoDbService.setPhoto(todoId, photo);
    updateDB();
  }

  void updateDB() async {
    final todoList = await todoDbService.getTodo();
    _todos[_getToDoIndexById(todoId)] = todoList[_getToDoIndexById(todoId)];
  }

  int _getToDoIndexById(String id) {
    final index = _todos.indexWhere((element) => element.id == id);
    if (index < 0) throw Exception("Index must be more than 0");
    return index;
  }

  Todo _getToDoById(String id) {
    final index = _getToDoIndexById(id);
    return _todos[index];
  }
}
