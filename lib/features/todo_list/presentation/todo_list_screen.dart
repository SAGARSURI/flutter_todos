import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todos/features/todo_list/di/get_todos_provider.dart';
import 'package:flutter_todos/features/todo_list/presentation/widgets/generic_error_widget.dart';
import 'package:flutter_todos/features/todo_list/presentation/widgets/no_todo_widget.dart';
import 'package:flutter_todos/features/todo_list/presentation/widgets/todo_list_widget.dart';

class TodoListScreen extends ConsumerStatefulWidget {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends ConsumerState<TodoListScreen> {
  @override
  void initState() {
    super.initState();
    final todoListNotifier = ref.read(getTodoListNotifierProvider.notifier);
    todoListNotifier.getTodos();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(getTodoListNotifierProvider);

    return Scaffold(
      body: viewModel.when(
        loading: () {
          return Container();
        },
        success: (todoList) {
          return todoList.isEmpty ? NoTodoWidget() : TodoListWidget();
        },
        error: (error) {
          return GenericErrorWidget();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
