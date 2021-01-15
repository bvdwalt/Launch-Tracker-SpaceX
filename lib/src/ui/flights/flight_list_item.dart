import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:spacex_flights/src/models/flight.dart';
import 'package:spacex_flights/src/ui/common/DateTimeTextWidget.dart';
import 'flight_detail.dart';

class FlightListItem extends StatefulWidget {
  final Flight flight;

  FlightListItem(this.flight);

  @override
  _FlightListItemState createState() => _FlightListItemState();
}

class _FlightListItemState extends State<FlightListItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
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
            onTap: () => openDetailPage()));
  }

  Widget titleColumn() {
    return Expanded(
      flex: 2,
      child: Column(
        // align the text to the left instead of centered
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(widget.flight.missionName ?? '',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text(widget.flight.flightNumber.toString() ?? '')
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
          Text(
            widget.flight.launchSite.siteName ?? '',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          DateTimeTextWidget(
            dateTime: widget.flight.launchDateUtc,
            style: TextStyle(
                color: widget.flight.upcoming
                    ? Colors.green[300]
                    : Colors.orange[300]),
            tbd: widget.flight.tbd,
            tentative: widget.flight.isTentative,
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
        children: <Widget>[
          Text(widget.flight.rocket.rocketName ?? '',
              style: TextStyle(fontSize: 12)),
          Text(widget.flight.rocket.secondStage.payloads
                      .any((element) => element.orbit == null) ||
                  widget.flight.rocket.secondStage.payloads
                          .map((e) => e.orbit)
                          .length ==
                      0
              ? ""
              : widget.flight.rocket.secondStage.payloads
                  .map((e) => e.orbit)
                  .toSet()
                  .join(',')),
        ],
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
          arguments: widget.flight,
        ),
      ),
    );
  }

  launchCountDownWidget() {
    var remaining =
        widget.flight.launchDateUtc.toLocal().difference(DateTime.now());

    return remaining.inHours > 0 && remaining.inHours <= 72
        ? getCountDownWidget()
        : SizedBox.shrink();
  }

  getCountDownWidget() {
    return StreamBuilder(
        stream: Stream.periodic(Duration(seconds: 1), (i) => i),
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          var remaining =
              widget.flight.launchDateUtc.toLocal().difference(DateTime.now());

          var formatMinutes = new DateFormat("mm");
          var formatSeconds = new DateFormat("ss");

          var dateString =
              "${remaining.inHours}h ${formatMinutes.format(DateTime.fromMillisecondsSinceEpoch(remaining.inMilliseconds))}m ${formatSeconds.format(DateTime.fromMillisecondsSinceEpoch(remaining.inMilliseconds))}s ";
          return Text(
            ' Launching in T-${dateString} ',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.green[300]),
          );
        });
  }
}
