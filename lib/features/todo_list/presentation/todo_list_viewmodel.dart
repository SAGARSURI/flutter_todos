import 'package:flutter_todos/core_features/todo/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_list_viewmodel.freezed.dart';

@freezed
class TodoListViewModel with _$TodoListViewModel {
  const factory TodoListViewModel.loading() = _Loading;
  const factory TodoListViewModel.success(List<Todo> todos) = _Success;
  const factory TodoListViewModel.error(String error) = _Error;
}
