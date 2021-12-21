import 'package:flutter_todos/core_features/todo/domain.dart';

abstract class GetTodosRepository {
  List<Todo> getTodos();
}
