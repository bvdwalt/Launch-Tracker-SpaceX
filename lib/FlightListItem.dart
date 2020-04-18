import 'package:flutter/material.dart';
import 'package:spacex_flights/DTOs/flight.dart';
import 'package:intl/intl.dart';

class FlightListItem extends StatelessWidget {
  final Flight flight;

  FlightListItem(this.flight);

  Widget titleColumn() {
    return Expanded(
      flex: 2,
      child: Column(
        // align the text to the left instead of centered
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(flight.missionName,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text('#${flight.flightNumber.toString()}')
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
            flight.launchSite.siteName,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          Text(
            DateFormat.yMMMd().format(flight.launchDateUtc) +
                "\n" +
                DateFormat.Hms().format(flight.launchDateUtc),
            textAlign: TextAlign.right,
            style: TextStyle(
                color: flight.upcoming ? Colors.orangeAccent[200] : Colors.greenAccent[200]),
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
          Text(flight.rocket.rocketName, style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

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
                  )
                ],
              ),
            ),
            onTap: () => print(flight.flightNumber)));
  }
}
