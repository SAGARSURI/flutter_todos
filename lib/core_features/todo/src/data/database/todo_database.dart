import 'package:flutter_todos/objectbox_gen/objectbox.g.dart';

Future<Store> initTodoDatabase() async {
  final store = await openStore();

  return store;
}
