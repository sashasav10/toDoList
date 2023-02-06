import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/todo.dart';
import '../../services/todo_db_provider.dart';
import '../../services/todo_service.dart';

part 'todo_history_list_store.g.dart';

class TodoHistoryStore extends _TodoHistoryStore with _$TodoHistoryStore {
  TodoHistoryStore({required super.todoDbService});

  static TodoHistoryStore of(context) => Provider.of(context, listen: false);
}

abstract class _TodoHistoryStore with Store {
  _TodoHistoryStore({required this.todoDbService}) {
    init();
  }

  final TodoDbService todoDbService;

  @observable
  ObservableList<Todo> _todos = ObservableList<Todo>();

  ObservableList<Todo> get todos =>
      ObservableList.of(_todos.where((element) => element.isHistory == true));

  @action
  Future<void> init() async {
    _todos.clear();
    _todos.addAll(
      await todoDbService.getTodo(),
    );
  }

  @action
  Future<void> deleteHistoryTodoItems() async {
    await todoDbService.deleteHistoryTodoItems();
    init();
  }
}
