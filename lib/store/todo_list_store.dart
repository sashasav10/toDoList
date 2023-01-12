import 'package:mobx/mobx.dart';
import 'package:to_do_list/toDo.dart';
import 'package:uuid/uuid.dart';

part 'todo_list_store.g.dart';

class TodoStore = _TodoStore with _$TodoStore;

abstract class _TodoStore with Store {
  _TodoStore({required this.uuid});

  final Uuid uuid;
  @observable
  ObservableList<Todo> _todos = ObservableList<Todo>();

  ObservableList<Todo> get todos => _todos;

  @action
  void handleTodoChange(Todo todo) {
    _todos[getToDoIndexById(todo.id)] = todo.copyWith(checked: !todo.checked);
  }

  @action
  void addTodoItem(String name) {
    _todos.add(Todo(id: uuid.v1(), name: name, checked: false));
  }

  @action
  void deleteTodoItem(String id) {
    _todos.removeWhere((item) => item.id == id);
  }

  @action
  void editTodoItem(String id, String name, bool isEdit) {
    _todos[getToDoIndexById(id)] =
        Todo(id: id, name: name, checked: false, isEdit: isEdit);
  }
  @action
  void deleteDoneTodoItems() {
    _todos.removeWhere((element) => element.checked == true);
  }

  int getToDoIndexById(String id) {
    final index = _todos.indexWhere((element) => element.id == id);
    if (index < 0) throw Exception("Index must be more than 0");
    return index;
  }
}
