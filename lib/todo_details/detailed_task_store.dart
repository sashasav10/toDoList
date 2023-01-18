import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/todo.dart';

import '../services/todo_db_service.dart';

part 'detailed_task_store.g.dart';

class DetailedTaskStore extends _DetailedTaskStore with _$DetailedTaskStore {
  DetailedTaskStore({required super.todoDbService, required super.id});

  static DetailedTaskStore of(context) => Provider.of(context, listen: false);
}

abstract class _DetailedTaskStore with Store {
  _DetailedTaskStore({required this.todoDbService, required this.id});
  @observable
  TodoDbService todoDbService;
  final String id;
  @observable
  Todo? todoItem;
  @observable
  ObservableList<Todo> _todos = ObservableList<Todo>();

  @action
  Future<void> init() async {
    final todoList = await todoDbService.getTodoFromSF();
    _todos.addAll(todoList);
    todoItem = _getToDoById(id);
  }

  @action
  void handleTodoChange() {
    _todos[_getToDoIndexById(id)] =
        todoItem!.copyWith(checked: !todoItem!.checked);
    todoDbService.addTodoToSP(_todos);
  }

  @action
  void deleteTodoItem() {
    _todos.removeWhere((item) => item.id == id);
    todoDbService.addTodoToSP(_todos);
  }

  @action
  void editTodoItem(String name, String description, bool isEdit) {
    _todos[_getToDoIndexById(id)] = Todo(
        id: id,
        name: name,
        description: description,
        checked: false,
        isEdit: isEdit);
    todoDbService.addTodoToSP(_todos);
  }

  @action
  void deleteDoneTodoItems() {
    _todos.removeWhere((element) => element.checked == true);
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
