import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todos/features/submit_todo/presentation/widgets/todo_title_field/todo_title_field_viewmodel.dart';

class TodoTitleFieldNotifier extends StateNotifier<TodoTitleFieldViewModel> {
  TodoTitleFieldNotifier() : super(TodoTitleFieldViewModel.notValidated());

  final _minLength = 3;
  final _maxLength = 8;
  final _invalidCharRegex = RegExp("""[!@#\$%^&*();/]""");

  void validate(String input) {
    if (input.length < _minLength) {
      state = TodoTitleFieldViewModel.minLengthError(_minLength);
    } else if (input.length > _maxLength) {
      state = TodoTitleFieldViewModel.maxLengthError(_maxLength);
    }
    if (input.contains(_invalidCharRegex)) {
      state = TodoTitleFieldViewModel.invalidCharactersError();
    }
  }
}
