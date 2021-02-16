import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:launch_tracker_spacex/src/ui/common/DateTimeTextWidget.dart';
import 'package:launch_tracker_spacex/src/ui/common/connected_widget.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  group("Common Widget tests:", () {
    testWidgets('Connected Widget test', (WidgetTester tester) async {
      await tester.pumpWidget(getConnectedWidget());

      await tester.pumpAndSettle();
    });

    testWidgets('DateTimeText Widget test', (WidgetTester tester) async {
      await tester.pumpWidget(
        DateTimeTextWidget(
          dateTime: DateTime.now().toUtc().subtract(Duration(hours: 2)),
          style: TextStyle(color: Colors.orange[300]),
          tbd: false,
        ),
      );

      await tester.pumpWidget(
        DateTimeTextWidget(
          dateTime: DateTime.now().toUtc().add(Duration(hours: 2)),
          style: TextStyle(color: Colors.green[300]),
          tbd: false,
        ),
      );

      await tester.pumpAndSettle();
    });
  });
}
