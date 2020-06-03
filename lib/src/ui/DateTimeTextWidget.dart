import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';

class DateTimeTextWidget extends StatelessWidget {
  DateTime dateTime;
  final TextStyle style;

  DateTimeTextWidget({this.dateTime, this.style});
  @override
  Widget build(BuildContext context) {
    this.dateTime = this.dateTime.toLocal();
    return Text(
        DateFormat.yMMMd().format(dateTime) +
            "\n" +
            DateFormat.Hms().format(dateTime),
        textAlign: TextAlign.right,
        style: style);
  }
}
