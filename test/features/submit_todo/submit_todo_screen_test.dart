import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todos/features/submit_todo/presentation/resource/constant.dart';
import 'package:flutter_todos/features/submit_todo/presentation/submit_todo_screen.dart';

void main() {
  testWidgets('screen should have title field', (tester) async {
    await tester.pumpWidget(_testableWidget());
    await tester.pump();

    expect(find.byKey(titleFieldKey), findsOneWidget);
  });

  testWidgets('screen should have note field', (tester) async {
    await tester.pumpWidget(_testableWidget());
    await tester.pump();

    expect(find.byKey(noteFieldKey), findsOneWidget);
  });

  testWidgets('screen should have date field', (tester) async {
    await tester.pumpWidget(_testableWidget());
    await tester.pump();

    expect(find.byKey(dateFieldKey), findsOneWidget);
  });

  testWidgets('screen should have submit button', (tester) async {
    await tester.pumpWidget(_testableWidget());
    await tester.pump();

    expect(find.byType(ElevatedButton), findsOneWidget);
  });
}

Widget _testableWidget() {
  return ProviderScope(
    child: MaterialApp(
      home: SubmitTodoScreen(),
    ),
  );
}
