import 'package:flutter/material.dart';
import 'package:to_do_list/set_photo/models/set_photo_screen_args.dart';
import 'package:to_do_list/set_photo/set_photo_screen.dart';
import 'package:to_do_list/todo_details/detailed_task_screen.dart';
import 'package:to_do_list/todo_details/models/detailed_task_screen_args.dart';
import 'package:to_do_list/todo_history/todo_history_screen.dart';
import 'package:to_do_list/todo_list/todo_list_screen.dart';

typedef _MaterialPageBuilder<TArgs> = Widget Function(
  BuildContext context,
  TArgs args,
);

Route<dynamic>? generateRoute(BuildContext context, RouteSettings settings) {
  MaterialPageRoute<TResult> materialRoute<TArgs, TResult>(
    _MaterialPageBuilder<TArgs> builder,
  ) {
    assert(
      settings.arguments is TArgs,
      '${settings.name} expects ${TArgs.toString()}',
    );

    final args = settings.arguments;
    if (args is TArgs) {
      return MaterialPageRoute<TResult>(
        settings: settings,
        builder: (context) => builder(context, args),
      );
    } else {
      throw ArgumentError.value(
        args,
        'args',
        '${settings.name} expects ${TArgs.toString()}',
      );
    }
  }

  switch (settings.name) {
    case TodoList.routeName:
      return materialRoute<void, void>(
        (context, args) => TodoList(),
      );
    case DetailedTaskScreen.routeName:
      return materialRoute<DetailedTaskScreenArgs, void>(
        (context, args) => DetailedTaskScreen(args: args),
      );
    case TodoHistoryList.routeName:
      return materialRoute<void, void>(
        (context, args) => TodoHistoryList(),
      );
    case SetPhotoScreen.routeName:
      return materialRoute<SetPhotoScreenArgs, void>(
        (context, args) => SetPhotoScreen(args: args),
      );
  }
  return null;
}
