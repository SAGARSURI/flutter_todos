import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todos/features/submit_todo/presentation/widgets/todo_note_field/todo_note_field_viewmodel.dart';

class TodoNoteFieldNotifier extends StateNotifier<TodoNoteFieldViewModel> {
  TodoNoteFieldNotifier() : super(TodoNoteFieldViewModel.notValidated());

  final _minLength = 10;
  final _maxLength = 100;
  final _invalidChars = RegExp("""[!@#\$%^&*();/]""");

  void validate(String input) {
    final trimmedInput = input.trim();
    if (trimmedInput.length < _minLength) {
      state = TodoNoteFieldViewModel.minLengthError(_minLength);
    } else if (trimmedInput.length > 100) {
      state = TodoNoteFieldViewModel.maxLengthError(_maxLength);
    } else if (trimmedInput.contains(_invalidChars)) {
      state = TodoNoteFieldViewModel.invalidChars();
    } else {
      state = TodoNoteFieldViewModel.valid();
    }
  }
}
