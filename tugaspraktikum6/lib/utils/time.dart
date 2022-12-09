import 'package:intl/intl.dart';

class TimeUtils {
  static String fromNanoToDefaultString(int nano) {
    final time = DateTime.fromMillisecondsSinceEpoch(nano);

    return DateFormat.yMEd().add_jm().format(time);
  }
}
