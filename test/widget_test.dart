import 'package:flutter_test/flutter_test.dart';
import 'package:spacex_flights/src/app.dart';

void main() {
  testWidgets('App Title Load test', (WidgetTester tester) async {
    await tester.pumpWidget(App());

    expect(find.text('SpaceX Flights'), findsOneWidget);
  });

  // testWidgets('FlightListItem loads flight correctly', (WidgetTester tester) async {
  //   await tester.pumpWidget(FlightListItem(FlightDataService.parseFlight(TestFlightObj.flightJson)[0]));

  //   expect(find.text('FalconSat'), findsOneWidget);
  //   expect(find.text('1'), findsOneWidget);
  // });
}
