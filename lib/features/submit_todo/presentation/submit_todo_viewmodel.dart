import 'package:freezed_annotation/freezed_annotation.dart';
part 'submit_todo_viewmodel.freezed.dart';

@freezed
class SubmitTodoViewModel with _$SubmitTodoViewModel {
  const factory SubmitTodoViewModel.initial() = _Initial;
  const factory SubmitTodoViewModel.loading() = _Loading;
  const factory SubmitTodoViewModel.success() = _Success;
}