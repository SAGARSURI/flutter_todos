import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todos/core_features/todo/data.dart';
import 'package:flutter_todos/core_features/todo/src/di/todo_database_provider.dart';
import 'package:flutter_todos/features/todo_list/data/repository/get_todos_repository_impl.dart';
import 'package:flutter_todos/features/todo_list/domain/repository/get_todos_repository.dart';
import 'package:flutter_todos/features/todo_list/domain/usecase/get_todos_use_case.dart';
import 'package:flutter_todos/features/todo_list/presentation/todo_list_notifier.dart';
import 'package:flutter_todos/features/todo_list/presentation/todo_list_viewmodel.dart';

final getTodosRepositoryProvider = Provider<GetTodosRepository>((ref) {
  final store = ref.read(todoDatabaseProvider);
  final repository =
      GetTodosRepositoryImpl(todoBox: store.box(), mapTodo: mapTodo);

  return repository;
});
final getTodosUseCaseProvider = Provider<GetTodosUseCase>((ref) {
  final repository = ref.read(getTodosRepositoryProvider);
  final useCase = () => getTodosUseCase(repository);

  return useCase;
});

final getTodoListNotifierProvider =
    StateNotifierProvider<TodoListNotifier, TodoListViewModel>((ref) {
  final useCase = ref.read(getTodosUseCaseProvider);

  return TodoListNotifier(useCase);
});
