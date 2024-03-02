import 'package:intl/intl.dart';

String formatDate(String inputDate) {
  DateTime dateTime = DateTime.parse(inputDate);
  return DateFormat('EEEE, d MMMM yyyy').format(dateTime);
}
