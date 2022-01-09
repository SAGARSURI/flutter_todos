import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_date_field_viewmodel.freezed.dart';

@freezed
class TodoDateFieldViewModel with _$TodoDateFieldViewModel {
  const factory TodoDateFieldViewModel.notValidated() = _NotValidated;

  const factory TodoDateFieldViewModel.valid() = _Valid;

  const factory TodoDateFieldViewModel.invalidDateFormatError() =
      _InvalidDateFormatError;

  const factory TodoDateFieldViewModel.invalidDateError() = _InvalidDateError;
}
