import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:spacex_flights/service_locator.dart';
import 'package:spacex_flights/src/app.dart';
import 'TestFlightObj.dart';
import 'package:http/http.dart' as http;

void main() {
  testWidgets('FlightListItem loads flight correctly',
      (WidgetTester tester) async {
    registerServices(testing: true);

    final client = getIt.get<http.Client>();

    when(client.get('https://api.spacexdata.com/v3/launches'))
        .thenAnswer((_) async => http.Response(TestFlightObj.flightJson, 200));

    await tester.pumpWidget(App());

    await tester.pumpAndSettle();

    expect(find.text('1', skipOffstage: false), findsOneWidget);
    expect(find.text('FalconSat', skipOffstage: false), findsOneWidget);
  });
}
