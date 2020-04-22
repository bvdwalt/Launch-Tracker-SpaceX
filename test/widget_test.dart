import 'package:flutter_test/flutter_test.dart';

import 'package:spacex_flights/main.dart';

void main() {
  testWidgets('App Title Load test', (WidgetTester tester) async {
    await tester.pumpWidget(SpaceXFlights());

    expect(find.text('SpaceX Flights'), findsOneWidget);
  });
}
