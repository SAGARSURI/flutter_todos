import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todos/features/submit_todo/di/submit_todo_provider.dart';
import 'package:flutter_todos/features/submit_todo/presentation/widgets/todo_date_field/todo_date_field_notifier.dart';
import 'package:flutter_todos/features/submit_todo/presentation/widgets/todo_date_field/todo_date_formatter.dart';
import 'package:fpdart/fpdart.dart';

class TodoDateField extends ConsumerWidget {
  const TodoDateField({
    Key? key,
    required this.onValidDate,
  }) : super(key: key);

  final Function(Option<String>) onValidDate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(todoDateFieldNotifierProvider);
    final notifier = ref.watch(todoDateFieldNotifierProvider.notifier);

    return viewModel.when(
      notValidated: () {
        onValidDate(Option.none());

        return _getField(notifier);
      },
      valid: (value) {
        onValidDate(Option.of(value));

        return _getField(notifier);
      },
      invalidDateFormatError: () {
        onValidDate(Option.none());

        return _getField(notifier, errorMessage: 'Invalid date format');
      },
      invalidDateError: () {
        onValidDate(Option.none());

        return _getField(notifier, errorMessage: 'Invalid date');
      },
    );
  }

  TextField _getField(TodoDateFieldNotifier notifier, {String? errorMessage}) {
    return TextField(
      keyboardType: TextInputType.datetime,
      decoration: InputDecoration(
        hintText: 'DD/MM/YYYY',
        errorText: errorMessage,
      ),
      inputFormatters: [TodoDateFormatter()],
      onChanged: (value) {
        notifier.validate(value);
      },
    );
  }
}
