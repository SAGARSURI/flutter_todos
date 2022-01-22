import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todos/features/submit_todo/presentation/widgets/todo_title_field/todo_title_field.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  late MockOnValidTitle mockOnValidTitle;

  setUp(() {
    mockOnValidTitle = MockOnValidTitle();
  });

  testWidgets(
    'field SHOULD show minLength error msg WHEN error is minLengthError',
    (tester) async {
      await tester.pumpWidget(_testableWidget(mockOnValidTitle));

      await tester.enterText(find.byType(TodoTitleField), 'sa');
      await tester.pump();

      final textField =
          find.byType(TextField).evaluate().single.widget as TextField;
      expect(textField.decoration?.errorText, equals('Title is too short'));
    },
  );

  testWidgets(
    'field SHOULD show maxLength error msg WHEN error is maxLengthError',
    (tester) async {
      await tester.pumpWidget(_testableWidget(mockOnValidTitle));

      await tester.enterText(
        find.byType(TodoTitleField),
        'this is not a title. It\'s too long to handle',
      );
      await tester.pump();

      final textField =
          find.byType(TextField).evaluate().single.widget as TextField;
      expect(
        textField.decoration?.errorText,
        equals('Title is too long'),
      );
    },
  );

  testWidgets(
    'field SHOULD show invalidChar error msg WHEN error is invalidCharactersError',
    (tester) async {
      await tester.pumpWidget(_testableWidget(mockOnValidTitle));

      await tester.enterText(find.byType(TodoTitleField), '!@#\$%');
      await tester.pump();

      final textField =
          find.byType(TextField).evaluate().single.widget as TextField;
      expect(
        textField.decoration?.errorText,
        equals('Title cannot have invalid characters'),
      );
    },
  );

  testWidgets(
    'field SHOULD not show error msg WHEN the input is valid',
    (tester) async {
      await tester.pumpWidget(_testableWidget(mockOnValidTitle));

      await tester.enterText(find.byType(TodoTitleField), 'This is a title');
      await tester.pump();

      final textField =
          find.byType(TextField).evaluate().single.widget as TextField;
      expect(textField.decoration?.errorText, isNull);
    },
  );

  testWidgets(
    'field SHOULD return title WHEN the input is valid',
    (tester) async {
      await tester.pumpWidget(_testableWidget(mockOnValidTitle));

      await tester.enterText(find.byType(TodoTitleField), 'This is a title');
      await tester.pump();

      verify(() => mockOnValidTitle(any())).called(1);
    },
  );
}

abstract class OnValidTitle {
  void call(String value);
}

class MockOnValidTitle extends Mock implements OnValidTitle {}

Widget _testableWidget(MockOnValidTitle mockOnValidTitle) {
  return ProviderScope(
    child: MaterialApp(
      home: Scaffold(
        body: TodoTitleField(
          onValidTitle: mockOnValidTitle,
        ),
      ),
    ),
  );
}
