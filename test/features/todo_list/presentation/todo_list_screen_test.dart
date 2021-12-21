import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todos/core_features/todo/domain.dart';
import 'package:flutter_todos/features/todo_list/di/get_todos_provider.dart';
import 'package:flutter_todos/features/todo_list/domain/repository/get_todos_repository.dart';
import 'package:flutter_todos/features/todo_list/presentation/todo_list_screen.dart';
import 'package:flutter_todos/features/todo_list/presentation/widgets/generic_error_widget.dart';
import 'package:flutter_todos/features/todo_list/presentation/widgets/no_todo_widget.dart';
import 'package:flutter_todos/features/todo_list/presentation/widgets/todo_list_widget.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  late MockGetTodosRepository mockGetTodosRepository;

  setUp(() {
    mockGetTodosRepository = MockGetTodosRepository();
  });
  testWidgets(
    'show no todo widget WHEN there are no todos',
    (WidgetTester tester) async {
      when(() => mockGetTodosRepository.getTodos()).thenReturn([]);

      await tester.pumpWidget(_testableWidget(mockGetTodosRepository));
      await tester.pumpAndSettle();

      expect(find.byType(TodoListWidget), findsNothing);
      expect(find.byType(NoTodoWidget), findsOneWidget);
    },
  );

  testWidgets('show todo list widget WHEN there are todos', (tester) async {
    when(() => mockGetTodosRepository.getTodos()).thenReturn([
      Todo.make(id: 1, title: 'title', note: 'note', date: DateTime(2021)),
    ]);

    await tester.pumpWidget(_testableWidget(mockGetTodosRepository));
    await tester.pumpAndSettle();

    expect(find.byType(TodoListWidget), findsOneWidget);
    expect(find.byType(NoTodoWidget), findsNothing);
  });

  testWidgets(
    'show error widget WHEN the request to retrieve failed',
    (tester) async {
      when(() => mockGetTodosRepository.getTodos()).thenThrow(Exception());

      await tester.pumpWidget(_testableWidget(mockGetTodosRepository));
      await tester.pumpAndSettle();

      expect(find.byType(TodoListWidget), findsNothing);
      expect(find.byType(GenericErrorWidget), findsOneWidget);
    },
  );
}

class MockGetTodosRepository extends Mock implements GetTodosRepository {}

Widget _testableWidget(MockGetTodosRepository mockGetTodosRepository) {
  return ProviderScope(
    overrides: [
      getTodosRepositoryProvider.overrideWithValue(mockGetTodosRepository),
    ],
    child: MaterialApp(
      home: TodoListScreen(),
    ),
  );
}
