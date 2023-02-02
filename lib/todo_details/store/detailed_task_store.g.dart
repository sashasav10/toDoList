// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detailed_task_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DetailedTaskStore on _DetailedTaskStore, Store {
  late final _$todoItemAtom =
      Atom(name: '_DetailedTaskStore.todoItem', context: context);

  @override
  Todo? get todoItem {
    _$todoItemAtom.reportRead();
    return super.todoItem;
  }

  @override
  set todoItem(Todo? value) {
    _$todoItemAtom.reportWrite(value, super.todoItem, () {
      super.todoItem = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_DetailedTaskStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

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

  late final _$updateTodosAsyncAction =
      AsyncAction('_DetailedTaskStore.updateTodos', context: context);

  @override
  Future<void> updateTodos() {
    return _$updateTodosAsyncAction.run(() => super.updateTodos());
  }

  late final _$changeAsMarkedAsyncAction =
      AsyncAction('_DetailedTaskStore.changeAsMarked', context: context);

  @override
  Future<void> changeAsMarked() {
    return _$changeAsMarkedAsyncAction.run(() => super.changeAsMarked());
  }

  late final _$deleteTodoItemAsyncAction =
      AsyncAction('_DetailedTaskStore.deleteTodoItem', context: context);

  @override
  Future<void> deleteTodoItem() {
    return _$deleteTodoItemAsyncAction.run(() => super.deleteTodoItem());
  }

  late final _$editTodoItemAsyncAction =
      AsyncAction('_DetailedTaskStore.editTodoItem', context: context);

  @override
  Future<void> editTodoItem(String name, String description, bool isEdit) {
    return _$editTodoItemAsyncAction
        .run(() => super.editTodoItem(name, description, isEdit));
  }

  late final _$deleteDoneTodoItemsAsyncAction =
      AsyncAction('_DetailedTaskStore.deleteDoneTodoItems', context: context);

  @override
  Future<void> deleteDoneTodoItems() {
    return _$deleteDoneTodoItemsAsyncAction
        .run(() => super.deleteDoneTodoItems());
  }

  @override
  String toString() {
    return '''
todoItem: ${todoItem},
isLoading: ${isLoading}
    ''';
  }
}
