// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TodoStore on _TodoStore, Store {
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

  late final _$initAsyncAction =
      AsyncAction('_TodoStore.init', context: context);

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$updateTodosAsyncAction =
      AsyncAction('_TodoStore.updateTodos', context: context);

  @override
  Future<void> updateTodos() {
    return _$updateTodosAsyncAction.run(() => super.updateTodos());
  }

  late final _$markAsDoneAsyncAction =
      AsyncAction('_TodoStore.markAsDone', context: context);

  @override
  Future<void> markAsDone(String id) {
    return _$markAsDoneAsyncAction.run(() => super.markAsDone(id));
  }

  late final _$deleteTodoItemAsyncAction =
      AsyncAction('_TodoStore.deleteTodoItem', context: context);

  @override
  Future<void> deleteTodoItem(String id) {
    return _$deleteTodoItemAsyncAction.run(() => super.deleteTodoItem(id));
  }

  late final _$editTodoItemAsyncAction =
      AsyncAction('_TodoStore.editTodoItem', context: context);

  @override
  Future<void> editTodoItem(
      String id, String name, String description, bool isEdit) {
    return _$editTodoItemAsyncAction
        .run(() => super.editTodoItem(id, name, description, isEdit));
  }

  late final _$deleteDoneTodoItemsAsyncAction =
      AsyncAction('_TodoStore.deleteDoneTodoItems', context: context);

  @override
  Future<void> deleteDoneTodoItems() {
    return _$deleteDoneTodoItemsAsyncAction
        .run(() => super.deleteDoneTodoItems());
  }

  late final _$deleteDoneTodoItemAsyncAction =
      AsyncAction('_TodoStore.deleteDoneTodoItem', context: context);

  @override
  Future<void> deleteDoneTodoItem(String id) {
    return _$deleteDoneTodoItemAsyncAction
        .run(() => super.deleteDoneTodoItem(id));
  }

  late final _$_TodoStoreActionController =
      ActionController(name: '_TodoStore', context: context);

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
  String toString() {
    return '''

    ''';
  }
}
