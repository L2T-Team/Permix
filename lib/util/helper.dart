import 'package:intl/intl.dart';

String getThousandSeparatedString(double num) {
  var formatter = NumberFormat('#,##,000');
  return formatter.format(num.toInt()).replaceAll(',', '.');
}
