import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todos/features/submit_todo/di/submit_todo_provider.dart';
import 'package:flutter_todos/features/submit_todo/presentation/widgets/todo_title_field/todo_title_field_notifier.dart';
import 'package:fpdart/fpdart.dart';

class TodoTitleField extends ConsumerWidget {
  const TodoTitleField({
    Key? key,
    required this.onValidTitle,
  }) : super(key: key);

  final Function(Option<String>) onValidTitle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(todoTitleFieldNotifierProvider);
    final notifier = ref.watch(todoTitleFieldNotifierProvider.notifier);

    return viewModel.when(
      valid: (value) {
        onValidTitle(Option.of(value));

        return _getField(notifier);
      },
      minLengthError: (minLength) {
        onValidTitle(Option.none());

        return _getField(notifier, errorMessage: 'Title is too short');
      },
      maxLengthError: (maxLength) {
        onValidTitle(Option.none());

        return _getField(notifier, errorMessage: 'Title is too long');
      },
      invalidCharactersError: () {
        onValidTitle(Option.none());

        return _getField(
          notifier,
          errorMessage: 'Title cannot have invalid characters',
        );
      },
      notValidated: () {
        onValidTitle(Option.none());
        
        return _getField(notifier);
      },
    );
  }

  Widget _getField(TodoTitleFieldNotifier notifier, {String? errorMessage}) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Title',
        errorText: errorMessage,
      ),
      onChanged: notifier.validate,
    );
  }
}
