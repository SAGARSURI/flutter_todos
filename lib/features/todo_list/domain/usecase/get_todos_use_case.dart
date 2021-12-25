import 'package:flutter_todos/core_features/todo/domain.dart';
import 'package:flutter_todos/features/todo_list/domain/repository/get_todos_repository.dart';

typedef GetTodosUseCase = List<Todo> Function();

List<Todo> getTodosUseCase(GetTodosRepository repository) {
  return repository.getTodos();
}
