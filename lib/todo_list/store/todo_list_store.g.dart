// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TodoStore on _TodoStore, Store {
  late final _$updateNeedAtom =
      Atom(name: '_TodoStore.updateNeed', context: context);

  @override
  bool? get updateNeed {
    _$updateNeedAtom.reportRead();
    return super.updateNeed;
  }

  @override
  set updateNeed(bool? value) {
    _$updateNeedAtom.reportWrite(value, super.updateNeed, () {
      super.updateNeed = value;
    });
  }

  late final _$_todosAtom = Atom(name: '_TodoStore._todos', context: context);

  @override
  ObservableList<Todo> get _todos {
    _$_todosAtom.reportRead();
    return super._todos;
  }

  @override
  set _todos(ObservableList<Todo> value) {
    _$_todosAtom.reportWrite(value, super._todos, () {
      super._todos = value;
    });
  }

  late final _$_todosHistoryAtom =
      Atom(name: '_TodoStore._todosHistory', context: context);

  @override
  ObservableList<Todo> get _todosHistory {
    _$_todosHistoryAtom.reportRead();
    return super._todosHistory;
  }

  @override
  set _todosHistory(ObservableList<Todo> value) {
    _$_todosHistoryAtom.reportWrite(value, super._todosHistory, () {
      super._todosHistory = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('_TodoStore.init', context: context);

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$_TodoStoreActionController =
      ActionController(name: '_TodoStore', context: context);

  @override
  void handleTodoChange(Todo todo) {
    final _$actionInfo = _$_TodoStoreActionController.startAction(
        name: '_TodoStore.handleTodoChange');
    try {
      return super.handleTodoChange(todo);
    } finally {
      _$_TodoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addTodoItem(String name, String description) {
    final _$actionInfo = _$_TodoStoreActionController.startAction(
        name: '_TodoStore.addTodoItem');
    try {
      return super.addTodoItem(name, description);
    } finally {
      _$_TodoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteTodoItem(String id) {
    final _$actionInfo = _$_TodoStoreActionController.startAction(
        name: '_TodoStore.deleteTodoItem');
    try {
      return super.deleteTodoItem(id);
    } finally {
      _$_TodoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void editTodoItem(String id, String name, String description, bool isEdit) {
    final _$actionInfo = _$_TodoStoreActionController.startAction(
        name: '_TodoStore.editTodoItem');
    try {
      return super.editTodoItem(id, name, description, isEdit);
    } finally {
      _$_TodoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteDoneTodoItems() {
    final _$actionInfo = _$_TodoStoreActionController.startAction(
        name: '_TodoStore.deleteDoneTodoItems');
    try {
      return super.deleteDoneTodoItems();
    } finally {
      _$_TodoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addDeletedToHistory() {
    final _$actionInfo = _$_TodoStoreActionController.startAction(
        name: '_TodoStore.addDeletedToHistory');
    try {
      return super.addDeletedToHistory();
    } finally {
      _$_TodoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
updateNeed: ${updateNeed}
    ''';
  }
}
