import 'package:flutter_todos/core_features/todo/data.dart';
import 'package:flutter_todos/core_features/todo/domain.dart';
import 'package:flutter_todos/features/submit_todo/domain/repository/submit_todo_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:objectbox/objectbox.dart';

class SubmitTodoRepositoryImpl extends SubmitTodoRepository {
  SubmitTodoRepositoryImpl({required this.todoBox, required this.mapLocalTodo});

  final Box<LocalTodo> todoBox;
  final LocalTodo Function(Todo) mapLocalTodo;

  @override
  IO<int> submitTodo(Todo todo) {
    return IO.of(todoBox.put(mapLocalTodo(todo)));
  }
}
