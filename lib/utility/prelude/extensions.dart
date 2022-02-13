import 'package:intl/intl.dart';

extension StringX on String {
  DateTime toDateTime(String format) {
    final dateFormatter = DateFormat(format);

    return dateFormatter.parse(this);
  }
}
