import 'package:clock/clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todos/features/submit_todo/presentation/widgets/todo_date_field/todo_date_field.dart';

void main() {
  testWidgets(
    'TodoDateField SHOULD show an input area WHEN rendered',
    (tester) async {
      await tester.pumpWidget(_testableWidget());

      final actual = find.byType(TextField).evaluate().single.widget as TextField;
      expect(actual, isA<TextField>());
    },
  );

  testWidgets(
    'TodoDateField SHOULD show invalid date format error message WHEN input is not a valid date format',
        (tester) async {
      await tester.pumpWidget(_testableWidget());

      await tester.enterText(find.byType(TodoDateField), '2022');
      await tester.pump();

      final actual = find.byType(TextField).evaluate().single.widget as TextField;
      expect(actual.decoration?.errorText, equals('Invalid date format'));
    },
  );

  testWidgets(
    'TodoDateField SHOULD show invalid date error message WHEN input date is behind the current date',
        (tester) async {
      withClock(Clock.fixed(DateTime(2022, 01, 10)), () async {
        await tester.pumpWidget(_testableWidget());

        await tester.enterText(find.byType(TodoDateField), '9/01/2022');
        await tester.pump();

        final actual = find.byType(TextField).evaluate().single.widget as TextField;
        expect(actual.decoration?.errorText, equals('Invalid date'));
      });
    },
  );
}

Widget _testableWidget() {
  return ProviderScope(
    child: MaterialApp(
      home: Scaffold(
        body: TodoDateField(),
      ),
    ),
  );
}