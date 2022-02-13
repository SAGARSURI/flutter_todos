import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todos/core_features/todo/data.dart';
import 'package:flutter_todos/core_features/todo/domain.dart';
import 'package:flutter_todos/core_features/todo/src/di/todo_database_provider.dart';
import 'package:flutter_todos/features/submit_todo/data/repository/submit_todo_repository_impl.dart';
import 'package:flutter_todos/features/submit_todo/domain/repository/submit_todo_repository.dart';
import 'package:flutter_todos/features/submit_todo/domain/usecase/submit_todo_use_case.dart';
import 'package:flutter_todos/features/submit_todo/presentation/submit_todo_notifier.dart';
import 'package:flutter_todos/features/submit_todo/presentation/submit_todo_viewmodel.dart';
import 'package:flutter_todos/features/submit_todo/presentation/widgets/todo_date_field/todo_date_field_notifier.dart';
import 'package:flutter_todos/features/submit_todo/presentation/widgets/todo_date_field/todo_date_field_viewmodel.dart';
import 'package:flutter_todos/features/submit_todo/presentation/widgets/todo_note_field/todo_note_field_notifier.dart';
import 'package:flutter_todos/features/submit_todo/presentation/widgets/todo_note_field/todo_note_field_viewmodel.dart';
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

final todoNoteFieldNotifierProvider =
    StateNotifierProvider<TodoNoteFieldNotifier, TodoNoteFieldViewModel>((ref) {
  return TodoNoteFieldNotifier();
});

final submitTodoRepositoryProvider = Provider<SubmitTodoRepository>((ref) {
  final store = ref.read(todoDatabaseProvider);

  return SubmitTodoRepositoryImpl(
    todoBox: store.box(),
    mapLocalTodo: mapLocalTodo,
  );
});

final useCaseProvider = Provider<SubmitTodoUseCase>((ref) {
  final repository = ref.read(submitTodoRepositoryProvider);

  return (Todo todo) => submitUseCase(todo, repository);
});

final submitTodoProvider =
    StateNotifierProvider.autoDispose<SubmitTodoNotifier, SubmitTodoViewModel>((ref) {
  final useCase = ref.read(useCaseProvider);

  return SubmitTodoNotifier(useCase);
});
