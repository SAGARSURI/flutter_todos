import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todos/utility/prelude/extensions.dart';

import 'todo_date_field_viewmodel.dart';

class TodoDateFieldNotifier extends StateNotifier<TodoDateFieldViewModel> {
  TodoDateFieldNotifier() : super(TodoDateFieldViewModel.notValidated());

  final _dateFormat = 'dd/MM/yyyy';

  void validate(String date) {
    try {
      final inputDate = date.toDateTime(_dateFormat);
      state = inputDate.isBefore(clock.now())
          ? TodoDateFieldViewModel.invalidDateError()
          : TodoDateFieldViewModel.valid(date);
    } on FormatException {
      state = TodoDateFieldViewModel.invalidDateFormatError();
    }
  }
}
