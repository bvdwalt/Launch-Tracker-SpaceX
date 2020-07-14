import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spacex_flights/EnvironmentConfig.dart';
import 'package:spacex_flights/service_locator.dart';
import 'package:spacex_flights/src/spacex_flights.dart';
import 'package:spacex_flights/src/ui/flights/flight_list_item.dart';
import 'package:network_image_mock/network_image_mock.dart';
import './data/TestUpcomingFlightObj.dart';
import './data/TestPastFlightObj.dart';
import 'package:http/http.dart' as http;

void main() {
  group("App widget testing", () {
    testWidgets('App loads flight correctly', (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        registerServices(testing: true);
        SharedPreferences.setMockInitialValues(
            {"user_theme_mode": "themeMode.system"});

        final client = getIt.get<http.Client>();

        when(client.get('${EnvironmentConfig.BASE_URL}/launches/upcoming'))
            .thenAnswer((_) async {
          sleep(Duration(seconds: 2));
          return http.Response(TestUpcomingFlightObj.flightJson, 200);
        });

        when(client.get('${EnvironmentConfig.BASE_URL}/launches/past'))
            .thenAnswer((_) async {
          sleep(Duration(seconds: 2));
          return http.Response(TestPastFlightObj.flightJson, 200);
        });

        await tester.pumpWidget(SpaceXFlights());

        await tester.pumpAndSettle();

        expect(find.text('110'), findsOneWidget);
        expect(find.text('ANASIS-II'), findsOneWidget);

        //find flight number 110 and tap the item to bring up the detail screen
        await tester.tap(find.byType(FlightListItem).first);
        await tester.pumpAndSettle();
        //Find the linkWidget and test that it can tapped and long pressed
        var linkWidget = find.byType(GestureDetector).first;
        await tester.longPress(linkWidget);
        await tester.pump();
        await tester.tap(linkWidget);
        await tester.pump();

        //navigate back to the list page
        await tester.pageBack();
        await tester.pumpAndSettle();

        //select the last tab (2), for Past flights
        await tester.tap(find.byType(Tab).last);
        await tester.pumpAndSettle();

        //Find flight number 1 and tap the item to bring up the detail screen
        expect(find.text('1'), findsOneWidget);
        expect(find.text('FalconSat'), findsOneWidget);

        await tester.tap(find.byType(FlightListItem).first);
        await tester.pumpAndSettle();
        await tester.tap(find.byType(GestureDetector).first);
        await tester.pump();
      });
    });

    // testWidgets('App Fails to load flights', (WidgetTester tester) async {
    //   TestWidgetsFlutterBinding.ensureInitialized();
    //   registerServices(testing: true);

    //   final client = getIt.get<http.Client>();

    //   when(client.get('${EnvironmentConfig.BASE_URL}/launches/upcoming'))
    //       .thenAnswer((_) async => http.Response('Internal Error', 500));

    //   when(client.get('${EnvironmentConfig.BASE_URL}/launches/past'))
    //       .thenAnswer((_) async => http.Response('Internal Error', 500));

    //   await tester.pumpWidget(SpaceXFlights());

    //   await tester.pumpAndSettle(Duration(seconds: 5));

    //   expect(() async => await find.byType(MyErrorWidget), findsOneWidget);
    // });
  });
}
