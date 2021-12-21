import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'todo.freezed.dart';

@freezed
class Todo with _$Todo {
  const factory Todo.make({
    required int id,
    required String title,
    required String note,
    required DateTime date,
  }) = _Todo;
}
