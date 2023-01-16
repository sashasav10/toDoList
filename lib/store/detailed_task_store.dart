import 'package:mobx/mobx.dart';
import 'package:to_do_list/todo.dart';
import 'package:uuid/uuid.dart';

import '../todo_db_service.dart';

part 'detailed_task_store.g.dart';

class DetailedTask = _DetailedTask with _$DetailedTask;

abstract class _DetailedTask with Store {
  _DetailedTask({required this.uuid, required this.todoDbService});

  final Uuid uuid;
  final TodoDbService todoDbService;
  @observable
  ObservableList<Todo> _todos = ObservableList<Todo>();

  ObservableList<Todo> get todos => _todos;

  @action
  Future<void> init() async {
    _todos.addAll(await todoDbService.getTodoFromSF());
  }

  @action
  void handleTodoChange(Todo todo) {
    _todos[getToDoIndexById(todo.id)] = todo.copyWith(checked: !todo.checked);
    todoDbService.addTodoToSP(_todos);
  }

  @action
  void deleteTodoItem(String id) {
    _todos.removeWhere((item) => item.id == id);
    todoDbService.addTodoToSP(_todos);
  }

  @action
  void editTodoItem(String id, String name, String description, bool isEdit) {
    _todos[getToDoIndexById(id)] = Todo(
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

  int getToDoIndexById(String id) {
    final index = _todos.indexWhere((element) => element.id == id);
    if (index < 0) throw Exception("Index must be more than 0");
    return index;
  }
}
