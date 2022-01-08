import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todos/features/submit_todo/presentation/widgets/todo_title_field/todo_title_field_notifier.dart';
import 'package:flutter_todos/features/submit_todo/presentation/widgets/todo_title_field/todo_title_field_viewmodel.dart';

void main() {
  late TodoTitleFieldNotifier sut;

  setUp(() {
    sut = TodoTitleFieldNotifier();
  });

  test('state SHOULD be notValidated WHEN view is created', () {
    var expectedState;

    sut.addListener((state) {
      expectedState = state;
    });

    expect(expectedState, equals(TodoTitleFieldViewModel.notValidated()));
  });

  test('state SHOULD be minLengthError WHEN input has length less then 3', () {
    var expectedState;

    sut.addListener((state) {
      expectedState = state;
    });

    sut.validate("sa");

    expect(expectedState, equals(TodoTitleFieldViewModel.minLengthError(3)));
  });

  test('state SHOULD be maxLengthError WHEN input has length more then 8', () {
    var expectedState;

    sut.addListener((state) {
      expectedState = state;
    });

    sut.validate("it's not a todo title");

    expect(expectedState, equals(TodoTitleFieldViewModel.maxLengthError(8)));
  });

  test(
    'state SHOULD be invalidCharacters WHEN input has invalid characters',
    () {
      var expectedState;

      sut.addListener((state) {
        expectedState = state;
      });

      sut.validate("%#\$@");

      expect(
        expectedState,
        equals(TodoTitleFieldViewModel.invalidCharactersError()),
      );
    },
  );
}
