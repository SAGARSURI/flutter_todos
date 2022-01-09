import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todos/features/submit_todo/di/submit_todo_provider.dart';
import 'package:flutter_todos/features/submit_todo/presentation/widgets/todo_date_field/todo_date_field_notifier.dart';

class TodoDateField extends ConsumerWidget {
  const TodoDateField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(todoDateFieldNotifierProvider);
    final notifier = ref.watch(todoDateFieldNotifierProvider.notifier);

    return viewModel.when(
      notValidated: () => _getField(notifier),
      valid: (value) => throw UnimplementedError(),
      invalidDateFormatError: () =>
          _getField(notifier, errorMessage: 'Invalid date format'),
      invalidDateError: () =>
          _getField(notifier, errorMessage: 'Invalid date'),
    );
  }

  TextField _getField(TodoDateFieldNotifier notifier, {String? errorMessage}) {
    return TextField(
      keyboardType: TextInputType.datetime,
      decoration: InputDecoration(
        hintText: 'DD/MM/YYYY',
        errorText: errorMessage,
      ),
      onChanged: (value) {
        notifier.validate(value);
      },
    );
  }
}
