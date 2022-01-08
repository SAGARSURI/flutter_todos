import 'package:freezed_annotation/freezed_annotation.dart';
part 'todo_title_field_viewmodel.freezed.dart';

@freezed
class TodoTitleFieldViewModel with _$TodoTitleFieldViewModel {
  const factory TodoTitleFieldViewModel.notValidated() = _NotValidated;

  const factory TodoTitleFieldViewModel.minLengthError(int minLength) =
      _MinLengthError;

  const factory TodoTitleFieldViewModel.maxLengthError(int maxLength) =
      _MaxLengthError;

  const factory TodoTitleFieldViewModel.invalidCharactersError() =
      _InvalidCharactersError;
}
