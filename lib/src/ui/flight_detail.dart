import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:spacex_flights/src/helpers/url_helper.dart';
import 'package:spacex_flights/src/models/flight.dart';

class FlightDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Flight flight = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
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
                              loadingBuilder: (BuildContext context,
                                  Widget child,
                                  ImageChunkEvent loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes
                                        : null,
                                  ),
                                );
                              },
                            ),
                    )),
              ];
            },
            body: GridView.count(
              physics: BouncingScrollPhysics(),
              crossAxisCount: 1,
              childAspectRatio: 10,
              padding: EdgeInsets.only(left: 20, right: 20),
              children: <Widget>[
                detailWidget(
                    "Launch Date",
                    DateFormat.yMMMEd()
                        .add_jm()
                        .format(flight.launchDateUtc.toLocal())),
                detailWidget("Mission Name", flight.missionName),
                detailWidget("Launch Site", flight.launchSite.siteNameLong),
                detailWidget("Flight Number", flight.flightNumber.toString()),
                detailWidget("Rocket Name", flight.rocket.rocketName),
                detailWidget("Rocket Type", flight.rocket.rocketType),
                detailWidgetWithLink("Wikipedia Link", flight.links.wikipedia),
                detailWidgetWithLink(
                    "Reddit Campaign", flight.links.redditCampaign),
                detailWidgetWithLink(
                    "Reddit Launch", flight.links.redditLaunch),
                detailWidgetWithLink(
                    "Reddit Recovery", flight.links.redditRecovery),
                detailWidgetWithLink(
                    "YouTube",
                    flight.links.youtubeId == null
                        ? null
                        : 'https://www.youtube.com/watch?v=${flight.links.youtubeId}'),
              ],
            )),
      ),
    );
  }
  
}

detailWidget(String title, String value) {
  return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
            child: Text(
          title,
          textAlign: TextAlign.left,
        )),
        Expanded(
            child: AutoSizeText(
          value ?? '',
          textAlign: TextAlign.right,
          maxLines: 2,
        ))
      ]);
}

detailWidgetWithLink(String title, String value) {
  return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
            child: Text(
          title,
          textAlign: TextAlign.left,
        )),
        Expanded(
            child: GestureDetector(
                onTap: () {
                  print(value);
                  launchURL(value);
                },
                child: AutoSizeText(
                  value ?? '',
                  textAlign: TextAlign.right,
                  style: TextStyle(color: Colors.blue),
                  maxLines: 2,
                )))
      ]);
}
