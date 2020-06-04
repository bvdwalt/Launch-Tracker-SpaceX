import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';

class DateTimeTextWidget extends StatefulWidget {
  final DateTime dateTime;
  final TextStyle style;

  DateTimeTextWidget({this.dateTime, this.style});

  @override
  _DateTimeTextWidgetState createState() => _DateTimeTextWidgetState();
}

class _DateTimeTextWidgetState extends State<DateTimeTextWidget> {
  @override
  Widget build(BuildContext context) {
    DateTime dateTime = this.widget.dateTime.toLocal();
    return Text(
        DateFormat.yMMMd().format(dateTime) +
            "\n" +
            DateFormat.Hms().format(dateTime),
        textAlign: TextAlign.right,
        style: widget.style);
  }
}
