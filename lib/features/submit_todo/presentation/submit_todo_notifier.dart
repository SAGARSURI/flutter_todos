import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todos/core_features/todo/domain.dart';
import 'package:flutter_todos/features/submit_todo/domain/usecase/submit_todo_use_case.dart';
import 'package:flutter_todos/utility/prelude/extensions.dart';
import 'package:fpdart/fpdart.dart';

import 'submit_todo_viewmodel.dart';

class SubmitTodoNotifier extends StateNotifier<SubmitTodoViewModel> {
  SubmitTodoNotifier(this._useCase) : super(SubmitTodoViewModel.initial());
  final SubmitTodoUseCase _useCase;

  String? _title;
  DateTime? _date;
  String? _note;

  void todoTitle(Option<String> title) {
    title.match((t) => _title = t, () => _title = null);
  }

  void todoDate(Option<String> date) {
    date.match((t) => _date = t.toDateTime('dd/MM/yyyy'), () => _date = null);
  }

  void submit() {
    if (_title != null && _date != null && _note != null) {
      state = SubmitTodoViewModel.loading();
      final id = _useCase(
        Todo.make(title: _title!, note: _note!, date: _date!),
      ).run();
      log('Todo id: $id');
      state = SubmitTodoViewModel.success();
    }
  }

  void todoNote(Option<String> note) {
    note.match((t) => _note = t, () => _note = null);
  }
}
