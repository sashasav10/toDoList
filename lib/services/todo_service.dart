import 'package:mobx/src/api/observable_collections.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/services/todo_db_provider.dart';
import 'package:to_do_list/todo.dart';

class TodoDbService {
  TodoDbService({
    required this.todoDbProvider,
  });
  final TodoDbProvider todoDbProvider;

  static TodoDbService of(context) => Provider.of(context, listen: false);

  Future<void> markAsDone(String id) async {
    final todos = await todoDbProvider.getTodoFromSF();
    final index = await getToDoIndexById(id);
    final todo = todos[index];
    todos[index] = todo.copyWith(checked: !todo.checked)!;
    await todoDbProvider.addTodoToSP(todos);
  }

  Future<Todo> getToDoById(String id) async {
    final todos = await todoDbProvider.getTodoFromSF();
    final index = todos.indexWhere((element) => element.id == id);
    if (index < 0) throw Exception("Index must be more than 0");

    return todos[index];
  }

  Future<int> getToDoIndexById(String id) async {
    final todos = await todoDbProvider.getTodoFromSF();
    final index = todos.indexWhere((element) => element.id == id);
    if (index < 0) throw Exception("Index must be more than 0");

    return index;
  }

  void addTodoToSP(List<Todo> todos) {
    todoDbProvider.addTodoToSP(todos);
  }

  void addHistoryTodoToSP(List<Todo> todosHistory) {
    todoDbProvider.addHistoryTodoToSP(todosHistory);
  }

  Future<List<Todo>> getHistoryTodoFromSF() {
    return todoDbProvider.getHistoryTodoFromSF();
  }

  Future<List<Todo>> getTodoFromSF() {
    return todoDbProvider.getTodoFromSF();
  }

  Future<void> editTodoItem(
      String id, String name, String description, bool isEdit) async {
    final todos = await todoDbProvider.getTodoFromSF();
    final index = await getToDoIndexById(id);
    todos[index] = todos[index].copyWith(
        id: id, name: name, description: description, isEdit: isEdit)!;
    addTodoToSP(todos);
  }
}
