import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todos/features/submit_todo/presentation/widgets/todo_note_field/todo_note_field_notifier.dart';
import 'package:flutter_todos/features/submit_todo/presentation/widgets/todo_note_field/todo_note_field_viewmodel.dart';

void main() {
  group('TodoNoteFieldNotifier', () {
    late TodoNoteFieldNotifier sut;

    setUp(() {
      sut = TodoNoteFieldNotifier();
    });

    test('state SHOULD be notValidated WHEN the view is created', () {
      var expectedState;

      sut.addListener((state) {
        expectedState = state;
      });

      expect(expectedState, equals(TodoNoteFieldViewModel.notValidated()));
    });

    test(
      'state SHOULD be minLengthError WHEN the input has less then 10 chars',
      () {
        var expectedState;

        sut.addListener((state) {
          expectedState = state;
        });

        sut.validate('Too short');

        expect(
          expectedState,
          equals(TodoNoteFieldViewModel.minLengthError(10)),
        );
      },
    );

    test(
      'state SHOULD be minLengthError WHEN the input has only spaces',
          () {
        var expectedState;

        sut.addListener((state) {
          expectedState = state;
        });

        sut.validate('           ');

        expect(
          expectedState,
          equals(TodoNoteFieldViewModel.minLengthError(10)),
        );
      },
    );

    test(
      'state SHOULD be maxLengthError WHEN the input has less then 100 chars',
      () {
        var expectedState;

        sut.addListener((state) {
          expectedState = state;
        });

        sut.validate(
          """Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
           Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
           Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
           Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.""",
        );

        expect(
          expectedState,
          equals(TodoNoteFieldViewModel.maxLengthError(100)),
        );
      },
    );

    test(
      'state SHOULD be valid WHEN the input is valid',
      () {
        var expectedState;

        sut.addListener((state) {
          expectedState = state;
        });

        sut.validate("This is valid note.");

        expect(
          expectedState,
          equals(TodoNoteFieldViewModel.valid("This is valid note.")),
        );
      },
    );
  });
}
