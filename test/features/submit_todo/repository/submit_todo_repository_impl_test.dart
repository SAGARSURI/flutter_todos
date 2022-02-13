import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todos/core_features/todo/data.dart';
import 'package:flutter_todos/core_features/todo/domain.dart';
import 'package:flutter_todos/features/submit_todo/data/repository/submit_todo_repository_impl.dart';
import 'package:mocktail/mocktail.dart';
import 'package:objectbox/objectbox.dart';

void main() {
  group(SubmitTodoRepositoryImpl, () {
    late MockBox mockBox;
    late SubmitTodoRepositoryImpl sut;

    setUp(() {
      mockBox = MockBox();
      sut = SubmitTodoRepositoryImpl(
        todoBox: mockBox,
        mapLocalTodo: mapLocalTodo,
      );
    });

    setUpAll(() {
      registerFallbackValue(
        LocalTodoFake(),
      );
    });

    test(
      'submitTodo SHOULD add todo to database, WHEN valid todo is provided',
      () {
        final todo = Todo.make(
          title: 'My Todo',
          note: 'Today is a good day.',
          date: DateTime(2022, 2, 25),
        );
        when(() => mockBox.put(any())).thenReturn(todo.id);

        final actual = sut.submitTodo(todo).run();

        verify(() => mockBox.put(any<LocalTodo>())).called(1);
        expect(actual, equals(todo.id));
      },
    );
  });
}

class MockBox extends Mock implements Box<LocalTodo> {}
class LocalTodoFake extends Fake implements LocalTodo {}
