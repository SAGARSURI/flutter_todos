import 'package:clock/clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todos/core_features/todo/domain.dart';
import 'package:flutter_todos/features/submit_todo/di/submit_todo_provider.dart';
import 'package:flutter_todos/features/submit_todo/domain/repository/submit_todo_repository.dart';
import 'package:flutter_todos/features/submit_todo/presentation/resource/constant.dart';
import 'package:flutter_todos/features/submit_todo/presentation/submit_todo_screen.dart';
import 'package:flutter_todos/features/submit_todo/presentation/widgets/success_widget.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  late SubmitTodoRepository mockSubmitTodoRepository;

  setUp(() {
    mockSubmitTodoRepository = MockSubmitTodoRepository();
  });
  setUpAll((){
    registerFallbackValue(TodoFake());
  });

  testWidgets('screen should have title field', (tester) async {
    await tester.pumpWidget(_testableWidget(mockSubmitTodoRepository));
    await tester.pump();

    expect(find.byKey(titleFieldKey), findsOneWidget);
  });

  testWidgets('screen should have note field', (tester) async {
    await tester.pumpWidget(_testableWidget(mockSubmitTodoRepository));
    await tester.pump();

    expect(find.byKey(noteFieldKey), findsOneWidget);
  });

  testWidgets('screen should have date field', (tester) async {
    await tester.pumpWidget(_testableWidget(mockSubmitTodoRepository));
    await tester.pump();

    expect(find.byKey(dateFieldKey), findsOneWidget);
  });

  testWidgets('screen should have submit button', (tester) async {
    await tester.pumpWidget(_testableWidget(mockSubmitTodoRepository));
    await tester.pump();

    expect(find.byType(ElevatedButton), findsOneWidget);
  });

  testWidgets(
    'submit button SHOULD not submit data, WHEN fields have invalid data',
    (tester) async {
      withClock(Clock.fixed(DateTime(2022, 01, 10)), () async {
        await tester.pumpWidget(_testableWidget(mockSubmitTodoRepository));
        await tester.pump();

        await tester.enterText(find.byKey(titleFieldKey), '!@\$');
        await tester.pump();
        await tester.enterText(find.byKey(dateFieldKey), '9/01/2022');
        await tester.pump();
        await tester.enterText(find.byKey(noteFieldKey), 'no');
        await tester.pump();
        await tester.tap(find.byKey(submitButtonKey));
        await tester.pump();

        expect(find.byType(SuccessWidget), findsNothing);
      });
    },
  );

  testWidgets(
    'submit button SHOULD submit data successfully, WHEN fields have valid data',
        (tester) async {
      withClock(Clock.fixed(DateTime(2022, 01, 10)), () async {
        when(() => mockSubmitTodoRepository.submitTodo(any())).thenReturn(IO.of(1));

        await tester.pumpWidget(_testableWidget(mockSubmitTodoRepository));
        await tester.pump();

        await tester.enterText(find.byKey(titleFieldKey), 'Good Title');
        await tester.pump();
        await tester.enterText(find.byKey(dateFieldKey), '11/01/2022');
        await tester.pump();
        await tester.enterText(find.byKey(noteFieldKey), 'It is a good note.');
        await tester.pump();
        await tester.tap(find.byKey(submitButtonKey));
        await tester.pump();

        expect(find.byType(SuccessWidget), findsOneWidget);
      });
    },
  );
}

class MockSubmitTodoRepository extends Mock implements SubmitTodoRepository {}
class TodoFake extends Mock implements Todo {}

Widget _testableWidget(SubmitTodoRepository mockGetTodosRepository) {
  return ProviderScope(
    overrides: [
      submitTodoRepositoryProvider.overrideWithValue(mockGetTodosRepository),
    ],
    child: MaterialApp(
      home: SubmitTodoScreen(),
    ),
  );
}
