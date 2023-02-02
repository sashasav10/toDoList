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
  @observable
  ObservableList<Todo> _todos = ObservableList<Todo>();
  @observable
  ObservableList<Todo> _todosHistory = ObservableList<Todo>();
  ObservableList<Todo> get todos => _todos;

  @action
  Future<void> init() async {
    _todos.clear();
    _todos.addAll(
      await todoDbService.getTodoFromSF(),
    );
  }

  @action
  Future<void> updateTodos() async {
    _todos = ObservableList.of(await todoDbService.getTodoFromSF());
  }

  @action
  Future<void> markAsDone(String id) async {
    await todoDbService.markAsDone(id);
    await updateTodos();
    print(_todos);
  }

  @action
  void addTodoItem(String name, String description) {
    _todos.add(
      Todo(id: uuid.v1(), name: name, description: description, checked: false),
    );
    todoDbService.addTodoToSP(_todos);
  }

  @action
  Future<void> deleteTodoItem(String id) async {
    await todoDbService.deleteTodoItem(id);
    await updateTodos();
  }

  @action
  Future<void> editTodoItem(
      String id, String name, String description, bool isEdit) async {
    await todoDbService.editTodoItem(id, name, description, isEdit);
    await updateTodos();
  }

  @action
  Future<void> deleteDoneTodoItems() async {
    await todoDbService.deleteDoneTodoItems();
    await updateTodos();
  }
}
