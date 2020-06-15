import 'package:flutter/material.dart';
import 'package:spacex_flights/src/blocs/flights_bloc.dart';
import 'package:spacex_flights/src/models/flight.dart';
import 'package:spacex_flights/src/resources/api_response.dart';
import 'package:spacex_flights/src/ui/common/loading_widget.dart';
import 'package:spacex_flights/src/ui/common/error_widget.dart';
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
          builder:
              (context, AsyncSnapshot<ApiResponse<List<Flight>>> snapshot) {
            if (snapshot.hasData) {
              switch (snapshot.data.status) {
                case Status.LOADING:
                  return LoadingWidget(loadingMessage: snapshot.data.message);
                  break;
                case Status.COMPLETED:
                  return RefreshIndicator(
                      onRefresh: () => bloc.fetchUpcomingFlights(),
                      child: buildList(snapshot.data.data));
                  break;
                case Status.ERROR:
                  return MyErrorWidget(
                    errorMessage: snapshot.data.message,
                    onRetryPressed: () => bloc.fetchUpcomingFlights(),
                  );
                  break;
              }
            }
            return Container();
          },
        ),
        StreamBuilder(
          stream: bloc.pastFlights,
          builder:
              (context, AsyncSnapshot<ApiResponse<List<Flight>>> snapshot) {
            if (snapshot.hasData) {
              switch (snapshot.data.status) {
                case Status.LOADING:
                  return LoadingWidget(loadingMessage: snapshot.data.message);
                  break;
                case Status.COMPLETED:
                  return RefreshIndicator(
                      onRefresh: () => bloc.fetchPastFlights(),
                      child: buildList(snapshot.data.data));
                  break;
                case Status.ERROR:
                  return MyErrorWidget(
                    errorMessage: snapshot.data.message,
                    onRetryPressed: () => bloc.fetchPastFlights(),
                  );
                  break;
              }
            }
            return Container();
          },
        ),
      ]),
    );
  }

  Widget buildList(List<Flight> data) {
    return ListView.separated(
        itemCount: data.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return FlightListItem(data[index]);
        },
        separatorBuilder: (BuildContext context, int index) {
          return Container(margin: EdgeInsets.only(top: 1.5));
        });
  }
}
