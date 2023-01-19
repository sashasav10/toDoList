// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detailed_task_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DetailedTaskStore on _DetailedTaskStore, Store {
  late final _$todoDbServiceAtom =
      Atom(name: '_DetailedTaskStore.todoDbService', context: context);

  @override
  TodoDbService get todoDbService {
    _$todoDbServiceAtom.reportRead();
    return super.todoDbService;
  }

  @override
  set todoDbService(TodoDbService value) {
    _$todoDbServiceAtom.reportWrite(value, super.todoDbService, () {
      super.todoDbService = value;
    });
  }

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

  late final _$_DetailedTaskStoreActionController =
      ActionController(name: '_DetailedTaskStore', context: context);

  @override
  void handleTodoChange() {
    final _$actionInfo = _$_DetailedTaskStoreActionController.startAction(
        name: '_DetailedTaskStore.handleTodoChange');
    try {
      return super.handleTodoChange();
    } finally {
      _$_DetailedTaskStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteTodoItem() {
    final _$actionInfo = _$_DetailedTaskStoreActionController.startAction(
        name: '_DetailedTaskStore.deleteTodoItem');
    try {
      return super.deleteTodoItem();
    } finally {
      _$_DetailedTaskStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void editTodoItem(String name, String description, bool isEdit) {
    final _$actionInfo = _$_DetailedTaskStoreActionController.startAction(
        name: '_DetailedTaskStore.editTodoItem');
    try {
      return super.editTodoItem(name, description, isEdit);
    } finally {
      _$_DetailedTaskStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
todoDbService: ${todoDbService},
todoItem: ${todoItem},
isLoading: ${isLoading}
    ''';
  }
}
