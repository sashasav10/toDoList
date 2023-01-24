import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/services/todo_db_service.dart';
import '../../services/image_api_service.dart';
import '../../todo.dart';
import '../image_result_model.dart';

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
  var todoItem;

  _ImageStore(
      {required this.imageApiService,
      required this.todoId,
      required this.todoDbService});
  final ImageApiService imageApiService;
  final String todoId;
  final TodoDbService todoDbService;
  @observable
  ImageResult? _images;
  ImageResult? get images => _images;
  ObservableList<Todo> _todos = ObservableList<Todo>();

  @action
  Future<void> init() async {
    final todoList = await todoDbService.getTodoFromSF();
    _todos.addAll(todoList);
    todoItem = _getToDoById(todoId);
    _images = await imageApiService.getImages(todoItem.name);
  }

  searchByPressedButton(searchText) async {
    _images = await imageApiService.getImages(searchText);
  }

  @action
  void setPhoto(String photo) {
    todoItem = todoItem?.copyWith(
      photo: photo,
    );
    updateDB();
  }

  void updateDB() async {
    _todos[_getToDoIndexById(todoId)] = todoItem!;
    todoDbService.addTodoToSP(_todos);
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
