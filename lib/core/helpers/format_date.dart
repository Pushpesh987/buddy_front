import 'package:intl/intl.dart';

String formatDate(String dateString) {
  try {
    DateTime date = DateTime.parse(dateString);

    return DateFormat('yyyy-MM-dd').format(date);
  } catch (e) {
    return '';
  }
}
