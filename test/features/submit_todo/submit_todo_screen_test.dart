import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todos/features/submit_todo/presentation/submit_todo_screen.dart';

void main() {
  testWidgets('screen should be empty when opened', (tester) async {
    await tester.pumpWidget(_testableWidget());
    await tester.pump();

    expect(find.byType(SizedBox), findsOneWidget);
  });
}

Widget _testableWidget() {
  return ProviderScope(
    child: MaterialApp(
      home: SubmitTodoScreen(),
    ),
  );
}
