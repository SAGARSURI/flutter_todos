import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todos/features/todo_list/domain/repository/get_todos_repository.dart';
import 'package:flutter_todos/features/todo_list/domain/usecase/get_todos_use_case.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group(GetTodosUseCase, (){
    late MockRepository repository;
    setUp((){
      repository = MockRepository();
    });
    test('call SHOULD return todo list WHEN repository is called', (){
      when(() => repository.getTodos()).thenReturn([]);
      
      final actual = getTodosUseCase(repository);

      expect(actual, equals([]));
      verify(() => repository.getTodos()).called(1);
    });
  });
}

class MockRepository extends Mock implements GetTodosRepository {}