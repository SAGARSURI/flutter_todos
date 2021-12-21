import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todos/features/todo_list/di/get_todos_provider.dart';

class TodoListWidget extends ConsumerWidget {
  const TodoListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(getTodoListNotifierProvider);

    return viewModel.maybeWhen(
      success: (todoList) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(todoList[index].title),
              subtitle: Text(todoList[index].note),
            );
          },
          itemCount: todoList.length,
        );
      },
      orElse: () => Text('Should not happen'),
    );
  }
}
