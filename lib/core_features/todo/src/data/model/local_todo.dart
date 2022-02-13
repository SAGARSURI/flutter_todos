import 'package:objectbox/objectbox.dart';

@Entity()
class LocalTodo {
  int id;
  String title;
  String note;
  @Property(type: PropertyType.date)
  DateTime date;
  LocalTodo({
    this.id = 0,
    required this.title,
    required this.note,
    required this.date,
  });
}
