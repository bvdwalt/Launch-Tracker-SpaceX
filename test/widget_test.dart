import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:launch_tracker_spacex/service_locator.dart';
import 'package:launch_tracker_spacex/src/spacex_flights.dart';
import 'package:launch_tracker_spacex/src/ui/common/error_widget.dart';
import 'package:launch_tracker_spacex/src/ui/flights/flight_list_item.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'setup_mock_api_responses.dart';

void main() {
  group("App widget testing:", () {
    testWidgets('App loads Settings screen', (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        registerServices(testing: true);
        SetupMockAPIResponses.MockDataAPIResponses();

        SharedPreferences.setMockInitialValues(
            {"user_theme_mode": "themeMode.system"});

        await tester.pumpWidget(SpaceXFlights());

        await tester.pumpAndSettle();

        await tester.press(find.ancestor(
            of: find.byIcon(Icons.settings),
            matching: find.byType(IconButton)));
      });
    });

    testWidgets('App loads flight correctly', (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        registerServices(testing: true);
        SetupMockAPIResponses.MockDataAPIResponses();

        SharedPreferences.setMockInitialValues(
            {"user_theme_mode": "themeMode.system"});

        await tester.pumpWidget(SpaceXFlights());

        await tester.pumpAndSettle();

        expect(find.text('116'), findsOneWidget);
        expect(find.text('Starlink-17 (v1.0)'), findsOneWidget);

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

    testWidgets('App Fails to load flights', (WidgetTester tester) async {
      registerServices(testing: true);
      SetupMockAPIResponses.MockErrorAPIResponses();

      await tester.pumpWidget(SpaceXFlights());

      await tester.pumpAndSettle(Duration(seconds: 3));

      var errorWidget = find.byType(MyErrorWidget);

      expect(errorWidget, findsOneWidget);

      await tester.tap(find.ancestor(
          of: find.text('Retry'), matching: find.byType(FlatButton)));

      await tester.pumpAndSettle();

      // //select the last tab (2), for Past flights
      // await tester.tap(find.byType(Tab).last);
      // await tester.pumpAndSettle();

      // expect(errorWidget, findsOneWidget);

      // await tester.tap(find.ancestor(
      //     of: find.text('Retry'), matching: find.byType(FlatButton)));
    });
  });
}
