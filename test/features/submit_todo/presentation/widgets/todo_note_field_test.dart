import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todos/features/submit_todo/presentation/widgets/todo_note_field/todo_note_field.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  late MockOnValidNote mockOnValidNote;

  setUp(() {
    mockOnValidNote = MockOnValidNote();
  });

  testWidgets(
    'TodoNoteField SHOULD show TextField WHEN it is created',
    (tester) async {
      await tester.pumpWidget(_testableWidget(mockOnValidNote));
      expect(find.byType(TextField), findsOneWidget);
    },
  );

  testWidgets(
    'TodoNoteField SHOULD show minLengthError message WHEN input is less then min length',
    (tester) async {
      await tester.pumpWidget(_testableWidget(mockOnValidNote));

      await tester.enterText(find.byType(TodoNoteField), 'too short');
      await tester.pump();

      final textField =
          find.byType(TextField).evaluate().single.widget as TextField;
      expect(textField.decoration?.errorText, equals('Note is too short'));
    },
  );

  testWidgets(
    'TodoNoteField SHOULD show maxLengthError message WHEN input exceeds max length',
    (tester) async {
      await tester.pumpWidget(_testableWidget(mockOnValidNote));

      await tester.enterText(
        find.byType(TodoNoteField),
        """Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
           Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
           Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
           Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.""",
      );
      await tester.pump();

      final textField =
          find.byType(TextField).evaluate().single.widget as TextField;
      expect(textField.decoration?.errorText, equals('Note is too long'));
    },
  );

  testWidgets(
    'TodoNoteField SHOULD not show error message WHEN input is valid',
    (tester) async {
      await tester.pumpWidget(_testableWidget(mockOnValidNote));

      await tester.enterText(
        find.byType(TodoNoteField),
        'This is a good note.',
      );
      await tester.pump();

      final textField =
          find.byType(TextField).evaluate().single.widget as TextField;
      expect(textField.decoration?.errorText, isNull);
    },
  );

  testWidgets(
    'TodoNoteField SHOULD return note WHEN input is valid',
    (tester) async {
      await tester.pumpWidget(_testableWidget(mockOnValidNote));

      await tester.enterText(
        find.byType(TodoNoteField),
        'This is a good note.',
      );
      await tester.pump();

      verify(() => mockOnValidNote(any())).called(1);
    },
  );
}

abstract class OnValidNote {
  void call(String value);
}

class MockOnValidNote extends Mock implements OnValidNote {}

Widget _testableWidget(MockOnValidNote mockOnValidNote) {
  return ProviderScope(
    child: MaterialApp(
      home: Scaffold(
        body: TodoNoteField(
          onValidNote: mockOnValidNote,
        ),
      ),
    ),
  );
}
