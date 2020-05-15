import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:spacex_flights/service_locator.dart';
import 'package:spacex_flights/src/app.dart';
import 'package:spacex_flights/src/ui/flight_list_item.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'TestFlightObj.dart';
import 'package:http/http.dart' as http;

void main() {
  testWidgets('App loads flight correctly', (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      registerServices(testing: true);

      final client = getIt.get<http.Client>();

      when(client.get('https://api.spacexdata.com/v3/launches')).thenAnswer(
          (_) async => http.Response(TestFlightObj.flightJson, 200));

      await tester.pumpWidget(App());

      await tester.pumpAndSettle();

      expect(find.text('1'), findsOneWidget);
      expect(find.text('FalconSat'), findsOneWidget);

      expect(find.text('110'), findsOneWidget);
      expect(find.text('ANASIS-II'), findsOneWidget);

      await tester.tap(find.byType(FlightListItem).first);
      await tester.pumpAndSettle();

      await tester.pageBack();
      await tester.pump();

      await tester.tap(find.byType(FlightListItem).last);
      await tester.pumpAndSettle();
    });
  });
}
