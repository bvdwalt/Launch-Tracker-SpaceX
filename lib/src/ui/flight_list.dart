import 'package:flutter/material.dart';
import 'package:spacex_flights/src/blocs/flights_bloc.dart';
import 'package:spacex_flights/src/models/flight.dart';
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

    bloc.fetchUpcomingFlights();
    bloc.fetchPastFlights();
  }

  @override
  void dispose() {
    _tabController.dispose();
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
          stream: bloc.upcomingFlights,
          builder: (context, AsyncSnapshot<List<Flight>> snapshot) {
            if (snapshot.hasData) {
              return buildList(snapshot, true);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
        StreamBuilder(
          stream: bloc.pastFlights,
          builder: (context, AsyncSnapshot<List<Flight>> snapshot) {
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

  Widget buildList(AsyncSnapshot<List<Flight>> snapshot, bool upcoming) {
    return ListView.separated(
        itemCount: snapshot.data.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return FlightListItem(snapshot.data[index]);
        },
        separatorBuilder: (BuildContext context, int index) {
          return Container(margin: EdgeInsets.only(top: 1.5));
        });
  }
}
