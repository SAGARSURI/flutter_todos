import '../model/local_todo.dart';
import '../../domain/model/todo.dart';
Todo mapTodo(LocalTodo localTodo) {
  return Todo.make(
    id: localTodo.id,
    title: localTodo.title,
    note: localTodo.note,
    date: localTodo.date,
  );
}
