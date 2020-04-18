import 'package:flutter/material.dart';
import 'package:spacex_flights/DTOs/flight.dart';
import 'package:spacex_flights/FlightListItem.dart';
import 'package:spacex_flights/Services/FlightDataService.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpaceX Flights',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(title: 'SpaceX Flights'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Flight> _flights = new List<Flight>();
  FlightDataService _flightDataService = new FlightDataService();

  @override
  Widget build(BuildContext context) {
    Widget body = new Scaffold(
      body: FutureBuilder(
          future: _flightDataService.fetchFlightData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done &&
                snapshot.hasData != null) {
              _flights.clear();
              return Center(child: new CircularProgressIndicator(value: null));
            } else {
              _flights = snapshot.data;

              return ListView.builder(
                  itemCount: _flights?.length ?? 0,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (BuildContext ctxt, int index) {
                    return FlightListItem(_flights[index]);
                  });
            }
          }),
    );

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: new Builder(builder: (BuildContext context) {
        return body;
      }),
      // drawer: Drawer(
      //   child: ListView(
      //     padding: EdgeInsets.zero,
      //     children: <Widget>[
      //       DrawerHeader(
      //         child: Text('Drawer Header'),
      //         decoration: BoxDecoration(
      //           color: Colors.blue,
      //         ),
      //       ),
      //       ListTile(
      //         title: Text('Item 1'),
      //         onTap: () {
      //           // Update the state of the app.
      //           // ...
      //         },
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
