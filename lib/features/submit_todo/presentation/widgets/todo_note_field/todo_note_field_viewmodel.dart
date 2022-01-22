import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_note_field_viewmodel.freezed.dart';

@freezed
class TodoNoteFieldViewModel with _$TodoNoteFieldViewModel {
  const factory TodoNoteFieldViewModel.notValidated() = _NotValidated;
  const factory TodoNoteFieldViewModel.minLengthError(int value) =
      _MinLengthError;
  const factory TodoNoteFieldViewModel.maxLengthError(int value) =
      _MaxLengthError;
  const factory TodoNoteFieldViewModel.valid(String value) = _Valid;
}
