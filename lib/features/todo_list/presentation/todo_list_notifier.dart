import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todos/features/todo_list/domain/usecase/get_todos_use_case.dart';
import 'package:flutter_todos/features/todo_list/presentation/todo_list_viewmodel.dart';

class TodoListNotifier extends StateNotifier<TodoListViewModel> {
  TodoListNotifier(this._getTodosUseCase) : super(TodoListViewModel.loading());

  final GetTodosUseCase _getTodosUseCase;

  void getTodos() {
    state = const TodoListViewModel.loading();
    try {
      final todoList = _getTodosUseCase();
      state = TodoListViewModel.success(todoList);
    } catch (e) {
      state = TodoListViewModel.error('Something went wrong');
    }
  }
}
