import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todos/features/submit_todo/presentation/widgets/todo_date_field/todo_date_field_notifier.dart';
import 'package:flutter_todos/features/submit_todo/presentation/widgets/todo_date_field/todo_date_field_viewmodel.dart';
import 'package:flutter_todos/features/submit_todo/presentation/widgets/todo_title_field/todo_title_field_notifier.dart';
import 'package:flutter_todos/features/submit_todo/presentation/widgets/todo_title_field/todo_title_field_viewmodel.dart';

final todoTitleFieldNotifierProvider =
    StateNotifierProvider<TodoTitleFieldNotifier, TodoTitleFieldViewModel>(
  (ref) {
    return TodoTitleFieldNotifier();
  },
);

final todoDateFieldNotifierProvider =
    StateNotifierProvider<TodoDateFieldNotifier, TodoDateFieldViewModel>(
  (ref) {
    return TodoDateFieldNotifier();
  },
);
