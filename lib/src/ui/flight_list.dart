import 'package:flutter/material.dart';
import 'package:spacex_flights/src/blocs/flights_bloc.dart';
import 'package:spacex_flights/src/models/flight.dart';
import 'package:spacex_flights/src/models/flights.dart';
import 'flight_list_item.dart';

class FlightList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FlightListState();
  }
}

class FlightListState extends State<FlightList> with TickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();

    _tabController = TabController(vsync: this, initialIndex: 0, length: 2);

    bloc.fetchAllFlights();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SpaceX Flights'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Upcoming'),
            Tab(text: 'Past'),
          ],
        ),
      ),
      body: TabBarView(controller: _tabController, children: <Widget>[
        StreamBuilder(
          stream: bloc.flights,
          builder: (context, AsyncSnapshot<Flights> snapshot) {
            if (snapshot.hasData) {
              return buildList(snapshot, true);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
        StreamBuilder(
          stream: bloc.flights,
          builder: (context, AsyncSnapshot<Flights> snapshot) {
            if (snapshot.hasData) {
              return buildList(snapshot, false);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ]),
    );
  }

  Widget buildList(AsyncSnapshot<Flights> snapshot, bool upcoming) {
    final List<Flight> flights =
        getUpcomingOrPastFlights(snapshot.data, upcoming);
    return ListView.separated(
        itemCount: flights.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return FlightListItem(flights[index]);
        },
        separatorBuilder: (BuildContext context, int index) {
          return Container(margin: EdgeInsets.only(top: 1.5));
        });
  }

  List<Flight> getUpcomingOrPastFlights(Flights flights, bool upcoming) {
    if (upcoming) {
      flights.flights
          .sort((a, b) => a.launchDateUtc.compareTo(b.launchDateUtc));
      return flights.flights.where((element) => element.upcoming).toList();
    } else {
      flights.flights.sort((a, b) => b.launchDateUtc.compareTo(a.launchDateUtc));
      return flights.flights
          .where((element) => element.upcoming == false)
          .toList();
    }
  }
}
