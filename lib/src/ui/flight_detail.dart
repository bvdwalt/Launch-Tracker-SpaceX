import 'package:flutter/material.dart';
import '../models/flight.dart';

class FlightDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Flight flight = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                  expandedHeight: 200.0,
                  floating: false,
                  pinned: true,
                  elevation: 0.0,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    background: flight.links.missionPatchSmall == null
                        ? Center(child: Text("No Image yet"))
                        : Image.network(
                            flight.links.missionPatchSmall,
                            fit: BoxFit.scaleDown,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes
                                      : null,
                                ),
                              );
                            },
                          ),
                  )),
            ];
          },
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(margin: EdgeInsets.only(top: 5.0)),
                Text(
                  flight.missionName + ' #' + flight.flightNumber.toString(),
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(margin: EdgeInsets.only(top: 8.0, bottom: 8.0)),
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 1.0, right: 1.0),
                    ),
                    Text(
                      flight.rocket.rocketName,
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10.0, right: 10.0),
                    ),
                    Text(
                      flight.launchDateUtc.toString(),
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
                Container(margin: EdgeInsets.only(top: 8.0, bottom: 8.0)),
                 Text(flight.upcoming.toString()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
