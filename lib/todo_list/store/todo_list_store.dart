import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/todo.dart';
import 'package:uuid/uuid.dart';

import '../../services/todo_db_service.dart';

part 'todo_list_store.g.dart';

class TodoStore extends _TodoStore with _$TodoStore {
  TodoStore({
    required super.uuid,
    required super.todoDbService,
  });

  static TodoStore of(context) => Provider.of(context, listen: false);
}

abstract class _TodoStore with Store {
  _TodoStore({required this.uuid, required this.todoDbService}) {
    init();
  }

  final Uuid uuid;
  final TodoDbService todoDbService;

  ObservableList<Todo> get todos => todoDbService.todos;

  @action
  Future<void> init() async {
    todoDbService.todosHistory.clear();
    todoDbService.todosHistory.addAll(
      await todoDbService.getHistoryTodoFromSF(),
    );

    todoDbService.todos.clear();
    todoDbService.todos.addAll(
      await todoDbService.getTodoFromSF(),
    );
  }

  @action
  void handleTodoChange(Todo todo) {
    todoDbService.todos[getToDoIndexById(todo.id)] =
        todo.copyWith(checked: !todo.checked)!;
    todoDbService.addTodoToSP(todoDbService.todos);
  }

  @action
  void addTodoItem(String name, String description) {
    todoDbService.todos.add(
      Todo(id: uuid.v1(), name: name, description: description, checked: false),
    );
    todoDbService.addTodoToSP(todoDbService.todos);
  }

  @action
  void deleteTodoItem(String id) {
    todoDbService.todos.removeWhere((item) => item.id == id);
    todoDbService.addTodoToSP(todoDbService.todos);
  }

  @action
  void editTodoItem(String id, String name, String description, bool isEdit) {
    todoDbService.todos[getToDoIndexById(id)] =
        todoDbService.todos[getToDoIndexById(id)].copyWith(
            id: id, name: name, description: description, isEdit: isEdit)!;
    todoDbService.addTodoToSP(todoDbService.todos);
  }

  @action
  void deleteDoneTodoItems() {
    addDeletedToHistory();
    todoDbService.todos.removeWhere((element) => element.checked == true);
    todoDbService.addTodoToSP(todoDbService.todos);
  }

  @action
  void addDeletedToHistory() {
    todoDbService.todosHistory.addAll(todoDbService.todos
        .where((element) => element.checked == true)
        .toList());
    todoDbService.addHistoryTodoToSP(todoDbService.todosHistory);
    todoDbService.todos.removeWhere((element) => element.checked == true);
    todoDbService.addTodoToSP(todoDbService.todos);
  }

  int getToDoIndexById(String id) {
    final index = todoDbService.todos.indexWhere((element) => element.id == id);
    if (index < 0) throw Exception("Index must be more than 0");
    return index;
  }

  Todo getToDoById(String id) {
    final index = todoDbService.todos.indexWhere((element) => element.id == id);
    if (index < 0) throw Exception("Index must be more than 0");
    return todoDbService.todos[index];
  }
}
