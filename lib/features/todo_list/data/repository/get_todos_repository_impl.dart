import 'package:flutter_todos/core_features/todo/data.dart';
import 'package:flutter_todos/core_features/todo/domain.dart';
import 'package:objectbox/objectbox.dart';

import '../../domain/repository/get_todos_repository.dart';

class GetTodosRepositoryImpl extends GetTodosRepository {
  GetTodosRepositoryImpl({required this.todoBox, required this.mapTodo});

  final Box<LocalTodo> todoBox;
  final Todo Function(LocalTodo) mapTodo;

  @override
  List<Todo> getTodos() =>
      todoBox.getAll().map((localTodo) => mapTodo(localTodo)).toList();
}
