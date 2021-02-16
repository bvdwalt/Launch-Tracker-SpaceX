import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:launch_tracker_spacex/src/blocs/flights_bloc.dart';
import 'package:launch_tracker_spacex/service_locator.dart';
import 'package:launch_tracker_spacex/src/ui/common/detail_widget.dart';
import 'package:launch_tracker_spacex/src/ui/common/detail_widget_tap_for_more.dart';
import 'package:launch_tracker_spacex/src/ui/common/detail_widget_with_link.dart';
import 'package:launch_tracker_spacex/src/ui/common/get_utc_date_time_from_unix.dart';
import 'package:launch_tracker_spacex/src/ui/widgets/launch_pad_name_widget.dart';
import 'package:launch_tracker_spacex/src/ui/widgets/payload_customers_widget.dart';
import 'package:launch_tracker_spacex/src/ui/widgets/payload_manufacturers_widget.dart';
import 'package:launch_tracker_spacex/src/ui/widgets/payload_mass_widget.dart';
import 'package:launch_tracker_spacex/src/ui/widgets/payload_nationality_widget.dart';
import 'package:launch_tracker_spacex/src/ui/widgets/payload_orbit_widget.dart';
import 'package:launch_tracker_spacex/src/ui/widgets/payload_type_widget.dart';
import 'package:launch_tracker_spacex/src/ui/widgets/rocket_name_widget.dart';
import 'package:spacex_api/models/launch/launch.dart';
import 'package:spacex_api/models/rocket/rocket.dart';

class FlightDetail extends StatefulWidget {
  @override
  _FlightDetailState createState() => _FlightDetailState();
}

class _FlightDetailState extends State<FlightDetail> {
  SpaceXDataBloc bloc = getIt.get<SpaceXDataBloc>();
  Rocket rocket;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Launch flight = ModalRoute.of(context).settings.arguments;

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

  addCalendarEvent(Launch flight) {
    final localDateTime = getUtcDateTimeFromUnix(flight.dateUnix);
    final Event event = Event(
        title: 'SpaceX ${flight.name} (${flight.flightNumber}) launch',
        description: '${flight.details}',
        location: '',
        startDate: localDateTime,
        endDate: localDateTime,
        allDay: false,
        timeZone: localDateTime.timeZoneName);
    Add2Calendar.addEvent2Cal(event);
  }

  SliverAppBar buildSliverAppBar(Launch flight) {
    return SliverAppBar(
      expandedHeight: 125.0,
      floating: true,
      pinned: true,
      elevation: 0.0,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        centerTitle: true,
        background: flight.links.patch.small == null
            ? Center(child: Text("No Image yet"))
            : Image.network(
                flight.links.patch.small,
                fit: BoxFit.scaleDown,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes
                            : null),
                  );
                },
              ),
      ),
    );
  }

  List<Widget> getAllFlightDetailWidgets(
      Launch launch, BuildContext _buildContext) {
    final dateTime = getUtcDateTimeFromUnix(launch.dateUnix);
    return <Widget>[
      getDetailWidget(
          "Launch Date",
          DateFormat.yMMMd().format(dateTime.toLocal()) +
              ' ' +
              DateFormat.Hms().format(dateTime.toLocal())),
      getDetailWidget("Flight Number", launch.flightNumber.toString()),
      getDetailWidget("Mission Name", launch.name),
      getDetailWidgetWithChild(
          "Rocket Name", RocketNameWidget(bloc: bloc, launch: launch)),
      getDetailWidgetWithChild("Launch Site",
          LaunchPadNameWidget(bloc: bloc, launch: launch, shortName: false)),
      getDetailWidgetTapForMore(
          "Launch Details", launch.details, _buildContext),
      getDetailWidget("Launch Upcoming", launch.upcoming ? "Yes" : "No"),
      getDetailWidget("To Be Determined", launch.tbd ? "Yes" : "No"),
      getDetailWidgetWithChild(
          "Payload Orbit", PayloadOrbitWidget(bloc: bloc, launch: launch)),
      getDetailWidgetWithChild(
          "Payload Type", PayloadTypeWidget(bloc: bloc, launch: launch)),
      getDetailWidgetWithChild("Payload Nationality",
          PayloadNationalityWidget(bloc: bloc, launch: launch)),
      getDetailWidgetWithChild("Payload Customers",
          PayloadCustomerWidget(bloc: bloc, launch: launch)),
      getDetailWidgetWithChild("Payload Manufacturer",
          PayloadManufacturerWidget(bloc: bloc, launch: launch)),
      getDetailWidgetWithChild(
          "Payload Mass (Kg)", PayloadMassWidget(bloc: bloc, launch: launch)),
      getDetailWidgetWithChild(
          "Payload Mass (Lbs)",
          PayloadMassWidget(
            bloc: bloc,
            launch: launch,
            showInKillograms: false,
          )),
      getDetailWidgetWithLink(
          "Wikipedia Link", launch.links.wikipedia, _buildContext),
      getDetailWidgetWithLink(
          "Reddit Campaign", launch.links.reddit.campaign, _buildContext),
      getDetailWidgetWithLink(
          "Reddit Launch", launch.links.reddit.launch, _buildContext),
      getDetailWidgetWithLink(
          "Reddit Recovery", launch.links.reddit.recovery, _buildContext),
      getDetailWidgetWithLink(
          "Press Kit", launch.links.presskit, _buildContext),
      getDetailWidgetWithLink(
          "YouTube",
          launch.links.youtubeId == null
              ? null
              : 'https://www.youtube.com/watch?v=${launch.links.youtubeId}',
          _buildContext),
    ];
  }
}
