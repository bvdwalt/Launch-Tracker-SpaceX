import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:spacex_flights/src/models/flight.dart';
import 'package:spacex_flights/src/ui/common/detail_widget_with_link.dart';
import 'package:spacex_flights/src/ui/common/detail_widget.dart';
import 'package:spacex_flights/src/ui/common/detail_widget_tap_for_more.dart';
import 'package:add_2_calendar/add_2_calendar.dart';

class FlightDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Flight flight = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: Builder(
        builder: (builderContent) => SafeArea(
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                buildSliverAppBar(flight),
              ];
            },
            body: GridView.count(
              physics: BouncingScrollPhysics(),
              crossAxisCount: 1,
              childAspectRatio: 10,
              padding: EdgeInsets.only(left: 20, right: 20),
              children: getAllFlightDetailWidgets(flight, builderContent),
            ),
          ),
        ),
      ),
      floatingActionButton: flight.upcoming
          ? FloatingActionButton(
              child: Icon(Icons.calendar_today),
              onPressed: () => addCalendarEvent(flight))
          : Container(),
    );
  }

  addCalendarEvent(Flight flight) {
    final localDateTime = flight.launchDateUtc.toLocal();
    final Event event = Event(
        title: 'SpaceX ${flight.missionName} (${flight.flightNumber}) launch',
        description: '${flight.details}',
        location: '${flight.launchSite.siteNameLong}',
        startDate: localDateTime,
        endDate: localDateTime,
        allDay: false,
        timeZone: localDateTime.timeZoneName);
    Add2Calendar.addEvent2Cal(event);
  }

  SliverAppBar buildSliverAppBar(Flight flight) {
    return SliverAppBar(
      expandedHeight: 150.0,
      floating: true,
      pinned: false,
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
                  var theme = Theme.of(context);
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(theme.primaryColor),
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes
                          : null,
                    ),
                  );
                },
              ),
      ),
    );
  }

  List<Widget> getAllFlightDetailWidgets(
      Flight flight, BuildContext _buildContext) {
    return <Widget>[
      getDetailWidget(
          "Launch Date",
          DateFormat.yMMMd().format(flight.launchDateUtc.toLocal()) +
              ' ' +
              DateFormat.Hms().format(flight.launchDateUtc.toLocal())),
      getDetailWidget("Flight Number", flight.flightNumber.toString()),
      getDetailWidget("Mission Name", flight.missionName),
      getDetailWidget("Launch Site", flight.launchSite.siteNameLong ?? ''),
      getDetailWidgetTapForMore(
          "Launch Details", flight.details, _buildContext),
      getDetailWidget(
          "Launch Successful",
          flight.launchSuccess == null
              ? ""
              : flight.launchSuccess
                  ? "Yes"
                  : "No"),
      getDetailWidget(
          "Launch Failure Reason",
          flight.launchSuccess == null || flight.launchSuccess == true
              ? ""
              : "${flight.launchFailureDetail.reason}"),
      getDetailWidget("Launch Tentative", flight.isTentative ? "Yes" : "No"),
      getDetailWidget("To Be Determined", flight.tbd ? "Yes" : "No"),
      getDetailWidget("Rocket Name", flight.rocket.rocketName),
      getDetailWidget(
          "First Stage Block",
          flight.rocket.firstStage.cores.length == 0 ||
                  flight.rocket.firstStage.cores[0].block == null
              ? ""
              : flight.rocket.firstStage.cores[0].block.toString()),
      getDetailWidget(
          "First Stage Serial",
          flight.rocket.firstStage.cores.length == 0 ||
                  flight.rocket.firstStage.cores[0].block == null
              ? ""
              : flight.rocket.firstStage.cores[0].coreSerial),
      getDetailWidget(
          "First Stage Reused",
          flight.rocket.firstStage.cores.length == 0 ||
                  flight.rocket.firstStage.cores[0].reused == null
              ? ""
              : flight.rocket.firstStage.cores[0].reused
                  ? "Yes ${flight.rocket.firstStage.cores[0].flight != null ? "(" + flight.rocket.firstStage.cores[0].flight.toString() + " times)" : ""}"
                  : "No"),
      getDetailWidget(
          "First Stage Landing Intent",
          flight.rocket.firstStage.cores.length == 0 ||
                  flight.rocket.firstStage.cores[0].landingIntent == null
              ? ""
              : flight.rocket.firstStage.cores[0].landingIntent
                  ? "Yes"
                  : "No" ?? ""),
      getDetailWidget(
          "First Stage Landing Successful",
          flight.rocket.firstStage.cores.length == 0 ||
                  flight.rocket.firstStage.cores[0].landSuccess == null
              ? ""
              : flight.rocket.firstStage.cores[0].landSuccess
                  ? "Yes"
                  : "No" ?? ""),
      getDetailWidget(
          "Second Stage Block",
          flight.rocket.firstStage.cores.length == 0 ||
                  flight.rocket.secondStage.block == null
              ? ""
              : flight.rocket.secondStage.block.toString()),
      getDetailWidget(
          "Payload Orbit",
          flight.rocket.secondStage.payloads
                      .any((element) => element.orbit == null) ||
                  flight.rocket.secondStage.payloads
                          .map((e) => e.orbit)
                          .length ==
                      0
              ? ""
              : flight.rocket.secondStage.payloads
                  .map((e) => e.orbit)
                  .toSet()
                  .join(',')),
      getDetailWidget(
          "Payload NORAD IDs",
          flight.rocket.secondStage.payloads
                      .where((element) => element.noradId.length != 0)
                      .length ==
                  0
              ? ""
              : flight.rocket.secondStage.payloads
                  .where((element) => element.noradId.length != 0)
                  .map((e) => e.noradId)
                  .toSet()
                  .join(',')
                  .replaceAll('[', '')
                  .replaceAll(']', '')),
      getDetailWidget(
          "Payload Customers",
          flight.rocket.secondStage.payloads
                      .map((e) => e.customers)
                      .where((element) => element.length != 0)
                      .length ==
                  0
              ? ""
              : flight.rocket.secondStage.payloads
                  .where((element) => element.customers.length != 0)
                  .map((e) => e.customers)
                  .toSet()
                  .join(',')
                  .replaceAll('[', '')
                  .replaceAll(']', '')),
      getDetailWidget(
          "Payload Nationality",
          flight.rocket.secondStage.payloads
                      .map((e) => e.nationality)
                      .where((element) => element != null)
                      .length ==
                  0
              ? ""
              : flight.rocket.secondStage.payloads
                  .where((element) => element.nationality != null)
                  .map((e) => e.nationality)
                  .toSet()
                  .join(',')),
      getDetailWidget(
          "Payload Manufacturer",
          flight.rocket.secondStage.payloads
                      .map((e) => e.manufacturer)
                      .where((element) => element != null)
                      .length ==
                  0
              ? ""
              : flight.rocket.secondStage.payloads
                  .where((element) => element.manufacturer != null)
                  .map((e) => e.manufacturer)
                  .toSet()
                  .join(',')),
      getDetailWidget(
          "Payload Type",
          flight.rocket.secondStage.payloads.map((e) => e.payloadType).length ==
                  0
              ? ""
              : flight.rocket.secondStage.payloads
                  .map((e) => e.payloadType)
                  .toSet()
                  .join(',')),
      getDetailWidget(
          "Payload Mass (kg)",
          flight.rocket.secondStage.payloads
                      .map((e) => e.payloadMassKg)
                      .where((element) => element != null)
                      .length ==
                  0
              ? ""
              : flight.rocket.secondStage.payloads
                  .where((element) => element.payloadMassKg != null)
                  .map((e) => e.payloadMassKg.toString())
                  .join(',')),
      getDetailWidgetWithLink(
          "Wikipedia Link", flight.links.wikipedia, _buildContext),
      getDetailWidgetWithLink(
          "Reddit Campaign", flight.links.redditCampaign, _buildContext),
      getDetailWidgetWithLink(
          "Reddit Launch", flight.links.redditLaunch, _buildContext),
      getDetailWidgetWithLink(
          "Reddit Recovery", flight.links.redditRecovery, _buildContext),
      getDetailWidgetWithLink(
          "Press Kit", flight.links.presskit, _buildContext),
      getDetailWidgetWithLink(
          "YouTube",
          flight.links.youtubeId == null
              ? null
              : 'https://www.youtube.com/watch?v=${flight.links.youtubeId}',
          _buildContext),
    ];
  }
}
