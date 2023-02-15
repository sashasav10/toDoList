import 'package:provider/provider.dart';
import 'package:to_do_list/provider/todo_db_provider.dart';
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
    final todos = await todoDbProvider.getTodos();
    final index = await getToDoIndexById(id);
    await todoDbProvider.updateTodo(
        index,
        todos[index].copyWith(
          photo: photo,
        )!);
  }

  Future<void> deleteTodoItem(String id) async {
    final index = await getToDoIndexById(id);
    await todoDbProvider.deleteTodo(index);
  }

  Future<void> deleteDoneTodoItems() async {
    final todos = await todoDbProvider.getTodos();
    todos.forEach((element) async {
      if (element.checked) {
        final index = await getToDoIndexById(element.id);
        final todo = todos[index];
        await todoDbProvider.updateTodo(index, todo.copyWith(isHistory: true)!);
      }
    });
  }

  Future<void> deleteDoneTodoItem(String id) async {
    final todos = await todoDbProvider.getTodos();
    final index = await getToDoIndexById(id);
    final todo = todos[index];
    await todoDbProvider.updateTodo(index, todo.copyWith(isHistory: true)!);
  }

  Future<void> deleteHistoryTodoItems() async {
    List keys = [];
    final todos = await todoDbProvider.getTodos();
    todos.forEach((element) async {
      if (element.isHistory) {
        keys.add(element.id);
      }
    });
    await todoDbProvider.deleteHistoryTodoItems(keys);
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

  void addTodo(Todo todo) {
    todoDbProvider.addTodo(todo);
  }

  Future<List<Todo>> getTodo() {
    return todoDbProvider.getTodos();
  }
}
