import 'package:flutter_todos/core_features/todo/domain.dart';
import 'package:fpdart/fpdart.dart';

abstract class SubmitTodoRepository {
  IO<int> submitTodo(Todo todo);
}