// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_history_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TodoHistoryStore on _TodoHistoryStore, Store {
  late final _$_todosAtom =
      Atom(name: '_TodoHistoryStore._todos', context: context);

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
      AsyncAction('_TodoHistoryStore.init', context: context);

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$deleteHistoryTodoItemsAsyncAction =
      AsyncAction('_TodoHistoryStore.deleteHistoryTodoItems', context: context);

  @override
  Future<void> deleteHistoryTodoItems() {
    return _$deleteHistoryTodoItemsAsyncAction
        .run(() => super.deleteHistoryTodoItems());
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
