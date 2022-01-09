import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'todo_date_field_viewmodel.dart';

class TodoDateFieldNotifier extends StateNotifier<TodoDateFieldViewModel> {
  TodoDateFieldNotifier() : super(TodoDateFieldViewModel.notValidated());

  final _dateFormatter = DateFormat('dd/MM/yyyy');

  void validate(String date) {
    try {
      final inputDate = _dateFormatter.parse(date);
      state = inputDate.isBefore(clock.now())
          ? TodoDateFieldViewModel.invalidDateError()
          : TodoDateFieldViewModel.valid();
    } on FormatException {
      state = TodoDateFieldViewModel.invalidDateFormatError();
    }
  }
}
