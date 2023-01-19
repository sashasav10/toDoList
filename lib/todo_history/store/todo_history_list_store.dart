import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/todo.dart';
import 'package:uuid/uuid.dart';

import '../../services/todo_db_service.dart';
import '../../services/todo_history_db_service.dart';

part 'todo_history_list_store.g.dart';

class TodoHistoryStore extends _TodoHistoryStore with _$TodoHistoryStore {
  TodoHistoryStore({required super.todoHistoryDbService});

  static TodoHistoryStore of(context) => Provider.of(context, listen: false);
}

abstract class _TodoHistoryStore with Store {
  _TodoHistoryStore({required this.todoHistoryDbService});

  final TodoHistoryDbService todoHistoryDbService;
  @observable
  ObservableList<Todo> _todos = ObservableList<Todo>();

  ObservableList<Todo> get todos => _todos;

  @action
  Future<void> init() async {
    _todos.addAll(
      await todoHistoryDbService.getTodoFromSF(),
    );
  }

  @action
  void addTodoItem(String id, String name, String description) {
    _todos.add(
      Todo(id: id, name: name, description: description, checked: true),
    );
    todoHistoryDbService.addTodoToSP(_todos);
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
