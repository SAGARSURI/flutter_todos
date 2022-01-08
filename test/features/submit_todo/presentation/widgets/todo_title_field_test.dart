import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todos/features/submit_todo/presentation/widgets/todo_title_field/todo_title_field.dart';

void main() {
  testWidgets(
    'field SHOULD show minLength error msg WHEN error is minLengthError',
    (tester) async {
      await tester.pumpWidget(_testableWidget());

      await tester.enterText(find.byType(TodoTitleField), 'sa');
      await tester.pump();

      final actual = find.text('Title is too short');
      expect(actual, findsOneWidget);
    },
  );
}

Widget _testableWidget() {
  return ProviderScope(
    child: MaterialApp(
      home: Scaffold(
        body: TodoTitleField(),
      ),
    ),
  );
}
