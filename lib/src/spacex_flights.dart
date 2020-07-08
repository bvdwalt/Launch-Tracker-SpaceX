import 'package:catcher/core/catcher.dart';
import 'package:flutter/material.dart';
import 'package:spacex_flights/src/ui/flight_list.dart';

class SpaceXFlights extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MaterialColor myColor = MaterialColor(0xFF0033CC, {
      50: Color.fromRGBO(0, 51, 204, .1),
      100: Color.fromRGBO(0, 51, 204, .2),
      200: Color.fromRGBO(0, 51, 204, .3),
      300: Color.fromRGBO(0, 51, 204, .4),
      400: Color.fromRGBO(0, 51, 204, .5),
      500: Color.fromRGBO(0, 51, 204, .6),
      600: Color.fromRGBO(0, 51, 204, .7),
      700: Color.fromRGBO(0, 51, 204, .8),
      800: Color.fromRGBO(0, 51, 204, .9),
      900: Color.fromRGBO(0, 51, 204, 1),
    });

    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: ThemeData(brightness: Brightness.light, primarySwatch: myColor),
      darkTheme: ThemeData(brightness: Brightness.dark, primarySwatch: myColor),
      navigatorKey: Catcher.navigatorKey,
      home: FlightList(),
    );
  }
}
