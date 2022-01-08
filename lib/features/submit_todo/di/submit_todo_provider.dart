import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todos/features/submit_todo/presentation/widgets/todo_title_field/todo_title_field_notifier.dart';
import 'package:flutter_todos/features/submit_todo/presentation/widgets/todo_title_field/todo_title_field_viewmodel.dart';

final todoTitleFieldNotifierProvider =
    StateNotifierProvider<TodoTitleFieldNotifier, TodoTitleFieldViewModel>(
  (ref) {
    return TodoTitleFieldNotifier();
  },
);
