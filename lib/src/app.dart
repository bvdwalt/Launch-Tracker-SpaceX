import 'package:flutter/material.dart';
import 'ui/flight_list.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.lightBlue,
      ),
      darkTheme:
          ThemeData(brightness: Brightness.dark, primarySwatch: Colors.blue),
      home: Scaffold(
          appBar: AppBar(title: Text('SpaceX Flights')), body: FlightList()),
    );
  }
}
