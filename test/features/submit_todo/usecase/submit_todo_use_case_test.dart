import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todos/core_features/todo/domain.dart';
import 'package:flutter_todos/features/submit_todo/domain/repository/submit_todo_repository.dart';
import 'package:flutter_todos/features/submit_todo/domain/usecase/submit_todo_use_case.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  late SubmitTodoRepository repository;

  setUp(() {
    repository = SubmitTodoRepositoryMock();
  });

  setUpAll(() {
    registerFallbackValue(TodoFake());
  });
  group(SubmitTodoUseCase, () {
    test(
      'submitUseCase SHOULD return todo id, WHEN todo is successfully submitted',
      () {
        final todo = Todo.make(
          title: 'My Todo',
          note: 'It is a great day.',
          date: DateTime(2022, 2, 25),
        );
        when(() => repository.submitTodo(any())).thenReturn(IO.of(todo.id));

        final actual = submitUseCase(todo, repository).run();

        verify(() => repository.submitTodo(any())).called(1);
        expect(actual, todo.id);
      },
    );
  });
}

class SubmitTodoRepositoryMock extends Mock implements SubmitTodoRepository {}

class TodoFake extends Fake implements Todo {}
