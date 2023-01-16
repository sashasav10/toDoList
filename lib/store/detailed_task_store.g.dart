// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detailed_task_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DetailedTaskStore on _DetailedTaskStore, Store {
  late final _$_todosAtom =
      Atom(name: '_DetailedTaskStore._todos', context: context);

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

  late final _$initAsyncAction =
      AsyncAction('_DetailedTaskStore.init', context: context);

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$_DetailedTaskStoreActionController =
      ActionController(name: '_DetailedTaskStore', context: context);

  @override
  void handleTodoChange(Todo todo) {
    final _$actionInfo = _$_DetailedTaskStoreActionController.startAction(
        name: '_DetailedTaskStore.handleTodoChange');
    try {
      return super.handleTodoChange(todo);
    } finally {
      _$_DetailedTaskStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteTodoItem(String id) {
    final _$actionInfo = _$_DetailedTaskStoreActionController.startAction(
        name: '_DetailedTaskStore.deleteTodoItem');
    try {
      return super.deleteTodoItem(id);
    } finally {
      _$_DetailedTaskStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void editTodoItem(String id, String name, String description, bool isEdit) {
    final _$actionInfo = _$_DetailedTaskStoreActionController.startAction(
        name: '_DetailedTaskStore.editTodoItem');
    try {
      return super.editTodoItem(id, name, description, isEdit);
    } finally {
      _$_DetailedTaskStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteDoneTodoItems() {
    final _$actionInfo = _$_DetailedTaskStoreActionController.startAction(
        name: '_DetailedTaskStore.deleteDoneTodoItems');
    try {
      return super.deleteDoneTodoItems();
    } finally {
      _$_DetailedTaskStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
