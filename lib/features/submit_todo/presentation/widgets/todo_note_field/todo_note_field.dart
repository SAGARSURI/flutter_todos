import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todos/features/submit_todo/di/submit_todo_provider.dart';
import 'package:flutter_todos/features/submit_todo/presentation/widgets/todo_note_field/todo_note_field_notifier.dart';
import 'package:fpdart/fpdart.dart';

class TodoNoteField extends ConsumerWidget {
  const TodoNoteField({
    Key? key,
    required this.onValidNote,
  }) : super(key: key);

  final Function(Option<String>) onValidNote;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(todoNoteFieldNotifierProvider);
    final notifier = ref.watch(todoNoteFieldNotifierProvider.notifier);

    return viewModel.when(
      notValidated: () {
        onValidNote(Option.none());

        return _getField(notifier);
      },
      minLengthError: (minLength) {
        onValidNote(Option.none());

        return _getField(notifier, errorMessage: 'Note is too short');
      },
      maxLengthError: (maxLength) {
        onValidNote(Option.none());

        return _getField(notifier, errorMessage: 'Note is too long');
      },
      valid: (value) {
        onValidNote(Option.of(value));

        return _getField(notifier);
      },
    );
  }

  Widget _getField(
    TodoNoteFieldNotifier notifier, {
    String? errorMessage,
  }) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Note',
        errorText: errorMessage,
      ),
      onChanged: notifier.validate,
      minLines: 5,
      maxLines: 5,
      keyboardType: TextInputType.multiline,
    );
  }
}
