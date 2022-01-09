import 'package:clock/clock.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todos/features/submit_todo/presentation/widgets/todo_date_field/todo_date_field_notifier.dart';
import 'package:flutter_todos/features/submit_todo/presentation/widgets/todo_date_field/todo_date_field_viewmodel.dart';

void main() {
  late TodoDateFieldNotifier sut;

  setUp(() {
    sut = TodoDateFieldNotifier();
  });
  test('state SHOULD be notValidated WHEN the view is created', () {
    var expectedState;

    sut.addListener((state) {
      expectedState = state;
    });

    expect(expectedState, equals(TodoDateFieldViewModel.notValidated()));
  });

  test(
    'state SHOULD be invalidDateFormatError WHEN input date doesn\'t have DD/MM/YYYY format',
    () {
      var expectedState;

      sut.addListener((state) {
        expectedState = state;
      });

      sut.validate("2022");

      expect(
        expectedState,
        equals(TodoDateFieldViewModel.invalidDateFormatError()),
      );
    },
  );

  test(
    'state SHOULD be invalidDateError WHEN the input date is less then today\'s date',
    () {
      var expectedState;
      final currentDate = DateTime(2022, 1, 10);

      sut.addListener((state) {
        expectedState = state;
      });

      withClock(Clock.fixed(currentDate), () {
        sut.validate("9/01/2022");
      });

      expect(expectedState, equals(TodoDateFieldViewModel.invalidDateError()));
    },
  );

  test(
    'state SHOULD be valid WHEN the input date is valid',
    () {
      var expectedState;

      sut.addListener((state) {
        expectedState = state;
      });

      withClock(Clock.fixed(DateTime(2022, 1, 10)), () {
        sut.validate("11/01/2022");
      });

      expect(expectedState, equals(TodoDateFieldViewModel.valid("11/01/2022")));
    },
  );
}
