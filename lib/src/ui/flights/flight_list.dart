import 'package:flutter/material.dart';
import 'package:spacex_flights/EnvironmentConfig.dart';
import 'package:spacex_flights/service_locator.dart';
import 'package:spacex_flights/src/blocs/flights_bloc.dart';
import 'package:spacex_flights/src/models/flight.dart';
import 'package:spacex_flights/src/resources/api_response.dart';
import 'package:spacex_flights/src/ui/common/connected_widget.dart';
import 'package:spacex_flights/src/ui/common/loading_widget.dart';
import 'package:spacex_flights/src/ui/common/error_widget.dart';
import 'package:spacex_flights/src/ui/common/settings_screen.dart';
import 'flight_list_item.dart';
import 'package:ads/ads.dart';
import 'package:firebase_admob/firebase_admob.dart';

class FlightList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FlightListState();
  }
}

class FlightListState extends State<FlightList> with TickerProviderStateMixin {
  FlightsBloc bloc = getIt.get<FlightsBloc>();
  Ads appAds;
  @override
  void initState() {
    super.initState();

    // Assign a listener.
    var eventListener = (MobileAdEvent event) {
      if (event == MobileAdEvent.opened) {
        print("eventListener: The opened ad is clicked on.");
      }
    };

    appAds = Ads(
      EnvironmentConfig.Ad_Mob_App_ID,
      bannerUnitId: EnvironmentConfig.Ad_Mob_Banner_ID,
      keywords: ['spacex', 'space', 'technology', 'rocket', 'launch'],
      listener: eventListener,
    );

    appAds.showBannerAd();

    bloc.fetchUpcomingFlights();
    bloc.fetchPastFlights();
  }

  @override
  void dispose() {
    appAds.dispose();
    getIt.unregister<FlightsBloc>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text('SpaceX Flights'),
          actions: <Widget>[
            getConnectedWidget(),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SettingsScreen();
                  },
                ),
              ),
            )
          ],
          bottom: TabBar(
            unselectedLabelStyle: theme.textTheme.caption,
            indicatorColor: theme.selectedRowColor,
            tabs: [Tab(text: 'Upcoming'), Tab(text: 'Past')],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            StreamBuilder(
              stream: bloc.upcomingFlights,
              builder:
                  (context, AsyncSnapshot<ApiResponse<List<Flight>>> snapshot) {
                if (snapshot.hasData) {
                  switch (snapshot.data.status) {
                    case Status.LOADING:
                      return LoadingWidget(
                          loadingMessage: snapshot.data.message);
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
                      return LoadingWidget(
                          loadingMessage: snapshot.data.message);
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
          ],
        ),
      ),
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
