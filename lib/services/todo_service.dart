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
    final todos = await todoDbProvider.getTodos();
    final index = await getToDoIndexById(id);
    final todo = todos[index];
    await todoDbProvider.updateTodo(
        index, todo.copyWith(checked: !todo.checked)!);
  }

  Future<void> editTodoItem(
      String id, String name, String description, bool isEdit) async {
    final todos = await todoDbProvider.getTodos();
    final index = await getToDoIndexById(id);
    final todo = todos[index];
    await todoDbProvider.updateTodo(
        index,
        todo.copyWith(
            id: id, name: name, description: description, isEdit: isEdit)!);
  }

  Future<void> setPhoto(String id, String photo) async {
    final _todos = await todoDbProvider.getTodos();
    final index = await getToDoIndexById(id);
    await todoDbProvider.updateTodo(
        index,
        _todos[index].copyWith(
          photo: photo,
        )!);
  }

  Future<void> deleteTodoItem(String id) async {
    final index = await getToDoIndexById(id);
    await todoDbProvider.deleteTodo(index);
  }

  Future<void> deleteDoneTodoItems() async {
    await addDeletedToHistory();
    final _todos = await todoDbProvider.getTodos();
    _todos.removeWhere((element) => element.checked == true);
    await todoDbProvider.addTodos(_todos);
  }

  Future<void> addDeletedToHistory() async {}

  Future<void> deleteHistoryTodoItems() async {
    // final _todosHistory = await todoDbProvider.getHistoryTodo();
    // _todosHistory.clear();
    //await todoDbProvider.addHistoryTodo(_todosHistory);
  }

  Future<Todo> getToDoById(String id) async {
    final todos = await todoDbProvider.getTodos();
    final index = todos.indexWhere((element) => element.id == id);
    if (index < 0) throw Exception("Index must be more than 0");

    return todos[index];
  }

  Future<int> getToDoIndexById(String id) async {
    final todos = await todoDbProvider.getTodos();
    final index = todos.indexWhere((element) => element.id == id);
    if (index < 0) throw Exception("Index must be more than 0");

    return index;
  }

  void addTodoToSP(List<Todo> todos) {
    todoDbProvider.addTodos(todos);
  }

  Future<List<Todo>> getTodoFromSF() {
    return todoDbProvider.getTodos();
  }
}
