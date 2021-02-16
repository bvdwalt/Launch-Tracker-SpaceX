import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:launch_tracker_spacex/service_locator.dart';
import 'package:launch_tracker_spacex/src/blocs/flights_bloc.dart';
import 'package:launch_tracker_spacex/src/ui/common/DateTimeTextWidget.dart';
import 'package:launch_tracker_spacex/src/ui/common/get_utc_date_time_from_unix.dart';
import 'package:launch_tracker_spacex/src/ui/widgets/launch_pad_name_widget.dart';
import 'package:launch_tracker_spacex/src/ui/widgets/rocket_name_widget.dart';
import 'package:spacex_api/models/launch/launch.dart';
import 'flight_detail.dart';

class FlightListItem extends StatefulWidget {
  final Launch launch;

  FlightListItem(this.launch);

  @override
  _FlightListItemState createState() => _FlightListItemState();
}

class _FlightListItemState extends State<FlightListItem> {
  SpaceXDataBloc bloc = getIt.get<SpaceXDataBloc>();
  @override
  void initState() {
    super.initState();

    bloc.fetchRockets();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Theme.of(context).backgroundColor,
      elevation: 3,
      child: InkWell(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [titleColumn(), launchSiteAndDate()],
              ),
              Row(
                children: [rocketColumn()],
              ),
              launchCountDownWidget()
            ],
          ),
        ),
        onTap: () => openDetailPage(),
      ),
    );
  }

  Widget titleColumn() {
    return Expanded(
      flex: 2,
      child: Column(
        // align the text to the left instead of centered
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(widget.launch.name ?? '',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text(widget.launch.flightNumber.toString() ?? '')
        ],
      ),
    );
  }

  Widget launchSiteAndDate() {
    return Expanded(
      flex: 1,
      child: Column(
        // align the text to the left instead of centered
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          LaunchPadNameWidget(bloc: bloc, launch: widget.launch),
          DateTimeTextWidget(
            dateTime: widget.launch.dateUnix != null
                ? getUtcDateTimeFromUnix(widget.launch.dateUnix)
                : null,
            style: TextStyle(
                color: widget.launch.upcoming
                    ? Colors.green[300]
                    : Colors.orange[300]),
            tbd: widget.launch.tbd,
          ),
        ],
      ),
    );
  }

  Widget rocketColumn() {
    return Expanded(
      flex: 2,
      child: Column(
        // align the text to the left instead of centered
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[RocketNameWidget(bloc: bloc, launch: widget.launch)],
      ),
    );
  }

  openDetailPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return FlightDetail();
        },
        settings: RouteSettings(
          arguments: widget.launch,
        ),
      ),
    );
  }

  launchCountDownWidget() {
    var remaining = getUtcDateTimeFromUnix(widget.launch.dateUnix)
        .toLocal()
        .difference(DateTime.now());

    return remaining.inHours > 0 && remaining.inHours <= 72
        ? getCountDownWidget()
        : SizedBox.shrink();
  }

  getCountDownWidget() {
    return StreamBuilder(
        stream: Stream.periodic(Duration(seconds: 1), (i) => i),
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          var remaining = getUtcDateTimeFromUnix(widget.launch.dateUnix)
              .toLocal()
              .difference(DateTime.now());

          var formatMinutes = new DateFormat("mm");
          var formatSeconds = new DateFormat("ss");

          var dateString =
              "${remaining.inHours}h ${formatMinutes.format(DateTime.fromMillisecondsSinceEpoch(remaining.inMilliseconds))}m ${formatSeconds.format(DateTime.fromMillisecondsSinceEpoch(remaining.inMilliseconds))}s ";
          return Text(
            ' Launching in T - ${dateString} ',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.green[300]),
          );
        });
  }
}
