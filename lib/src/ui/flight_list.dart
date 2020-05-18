import 'package:flutter/material.dart';
import 'package:spacex_flights/src/blocs/flights_bloc.dart';
import 'package:spacex_flights/src/models/flights.dart';

import 'flight_list_item.dart';

class FlightList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FlightListState();
  }
}

class FlightListState extends State<FlightList> {
  @override
  void initState() {
    super.initState();
    bloc.fetchAllFlights();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.allFlights,
      builder: (context, AsyncSnapshot<Flights> snapshot) {
        if (snapshot.hasData) {
          return buildList(snapshot);
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget buildList(AsyncSnapshot<Flights> snapshot) {
    return ListView.separated(
        itemCount: snapshot.data.flights.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return FlightListItem(snapshot.data.flights[index]);
        },
        separatorBuilder: (BuildContext context, int index) {
          return Container(margin: EdgeInsets.only(top: 1.5));
        });
  }
}
