import 'package:flutter_todos/core_features/todo/domain.dart';
import 'package:flutter_todos/features/submit_todo/domain/repository/submit_todo_repository.dart';
import 'package:fpdart/fpdart.dart';

typedef SubmitTodoUseCase = IO<int> Function(Todo);

IO<int> submitUseCase(Todo todo, SubmitTodoRepository repository) {
  return repository.submitTodo(todo);
}
