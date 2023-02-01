import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/todo.dart';
import 'package:uuid/uuid.dart';

import '../../services/todo_db_provider.dart';
import '../../services/todo_service.dart';

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

  ObservableList<Todo> _todos = ObservableList<Todo>();
  ObservableList<Todo> _todosHistory = ObservableList<Todo>();
  ObservableList<Todo> get todos => _todos;

  @action
  Future<void> init() async {
    _todosHistory.clear();
    _todosHistory.addAll(
      await todoDbService.getHistoryTodoFromSF(),
    );

    _todos.clear();
    _todos.addAll(
      await todoDbService.getTodoFromSF(),
    );
  }

  @action
  Future<void> markAsDone(String id) async {
    todoDbService.markAsDone(id);
    _todos = await todoDbService.getTodoFromSF();
  }

  @action
  void addTodoItem(String name, String description) {
    _todos.add(
      Todo(id: uuid.v1(), name: name, description: description, checked: false),
    );
    todoDbService.addTodoToSP(_todos);
  }

  @action
  void deleteTodoItem(String id) {
    _todos.removeWhere((item) => item.id == id);
    todoDbService.addTodoToSP(_todos);
  }

  @action
  void editTodoItem(String id, String name, String description, bool isEdit) {
    todoDbService.editTodoItem(id, name, description, isEdit);
  }

  @action
  void deleteDoneTodoItems() {
    addDeletedToHistory();
    _todos.removeWhere((element) => element.checked == true);
    todoDbService.addTodoToSP(_todos);
  }

  @action
  void addDeletedToHistory() {
    _todosHistory
        .addAll(_todos.where((element) => element.checked == true).toList());
    todoDbService.addHistoryTodoToSP(_todosHistory);
    _todos.removeWhere((element) => element.checked == true);
    todoDbService.addTodoToSP(_todos);
  }

  int getToDoIndexById(String id) {
    final index = _todos.indexWhere((element) => element.id == id);
    if (index < 0) throw Exception("Index must be more than 0");
    return index;
  }

  Todo getToDoById(String id) {
    final index = _todos.indexWhere((element) => element.id == id);
    if (index < 0) throw Exception("Index must be more than 0");
    return _todos[index];
  }
}
