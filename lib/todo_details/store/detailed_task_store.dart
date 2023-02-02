import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/todo.dart';

import '../../services/todo_db_provider.dart';
import '../../services/todo_service.dart';

part 'detailed_task_store.g.dart';

class DetailedTaskStore extends _DetailedTaskStore with _$DetailedTaskStore {
  DetailedTaskStore({required super.todoDbService, required super.id});

  static DetailedTaskStore of(context) => Provider.of(context, listen: false);
}

abstract class _DetailedTaskStore with Store {
  _DetailedTaskStore({required this.todoDbService, required this.id}) {
    init();
  }

  TodoDbService todoDbService;
  final String id;
  @observable
  Todo? todoItem;
  @observable
  bool isLoading = false;
  @observable
  ObservableList<Todo> _todos = ObservableList<Todo>();

  @action
  Future<void> init() async {
    isLoading = true;
    final todoList = await todoDbService.getTodoFromSF();
    _todos.addAll(todoList);
    todoItem = _getToDoById(id);
    await Future.delayed(const Duration(seconds: 1));
    isLoading = false;
  }

  @action
  Future<void> updateTodos() async {
    _todos = ObservableList.of(await todoDbService.getTodoFromSF());
    todoItem = _getToDoById(id);
  }

  @action
  Future<void> changeAsMarked() async {
    await todoDbService.markAsDone(id);
    await updateTodos();
  }

  @action
  Future<void> deleteTodoItem() async {
    await todoDbService.deleteTodoItem(todoItem!.id);
    await updateTodos();
  }

  @action
  Future<void> editTodoItem(
      String name, String description, bool isEdit) async {
    await todoDbService.editTodoItem(id, name, description, isEdit);
    await updateTodos();
  }

  @action
  Future<void> deleteDoneTodoItems() async {
    await todoDbService.deleteDoneTodoItems();
    await updateTodos();
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
