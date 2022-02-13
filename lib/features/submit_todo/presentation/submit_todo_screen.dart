import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todos/features/submit_todo/di/submit_todo_provider.dart';
import 'package:flutter_todos/features/submit_todo/presentation/resource/constant.dart';
import 'package:flutter_todos/features/submit_todo/presentation/widgets/todo_date_field/todo_date_field.dart';
import 'package:flutter_todos/features/submit_todo/presentation/widgets/todo_note_field/todo_note_field.dart';

import 'widgets/success_widget.dart';
import 'widgets/todo_title_field/todo_title_field.dart';

class SubmitTodoScreen extends ConsumerWidget {
  const SubmitTodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(submitTodoProvider);
    log(viewModel.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text('Submit Todo'),
      ),
      body: viewModel.when(
        initial: () => _TodoForm(),
        loading: () => Center(
          child: CircularProgressIndicator.adaptive(),
        ),
        success: () => SuccessWidget(),
      ),
    );
  }
}

class _TodoForm extends ConsumerWidget {
  const _TodoForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(submitTodoProvider.notifier);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TodoTitleField(
            key: titleFieldKey,
            onValidTitle: notifier.todoTitle,
          ),
          const SizedBox(height: 8),
          TodoDateField(
            key: dateFieldKey,
            onValidDate: notifier.todoDate,
          ),
          const SizedBox(height: 8),
          TodoNoteField(
            key: noteFieldKey,
            onValidNote: notifier.todoNote,
          ),
          const Spacer(),
          ElevatedButton(
            key: submitButtonKey,
            child: Text('Submit'),
            onPressed: notifier.submit,
          ),
        ],
      ),
    );
  }
}
