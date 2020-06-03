import 'flight.dart';

class Flights {
  List<Flight> flights;

  Flights({this.flights});

  factory Flights.fromJson(List<dynamic> parsedJson) {
    List<Flight> flights = List<Flight>();

    flights = parsedJson.map((i) => Flight.fromJson(i)).toList();

    return Flights(flights: flights);
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['flight_number'] = this.flightNumber;
  //   data['mission_name'] = this.missionName;
  //   data['mission_id'] = this.missionId;
  //   data['launch_year'] = this.launchYear;
  //   data['launch_date_unix'] = this.launchDateUnix;
  //   data['launch_date_utc'] = this.launchDateUtc;
  //   data['launch_date_local'] = this.launchDateLocal;
  //   data['is_tentative'] = this.isTentative;
  //   data['tentative_max_precision'] = this.tentativeMaxPrecision;
  //   data['tbd'] = this.tbd;
  //   data['launch_window'] = this.launchWindow;
  //   if (this.rocket != null) {
  //     data['rocket'] = this.rocket.toJson();
  //   }
  //   data['ships'] = this.ships;
  //   if (this.telemetry != null) {
  //     data['telemetry'] = this.telemetry.toJson();
  //   }
  //   if (this.launchSite != null) {
  //     data['launch_site'] = this.launchSite.toJson();
  //   }
  //   data['launch_success'] = this.launchSuccess;
  //   if (this.links != null) {
  //     data['links'] = this.links.toJson();
  //   }
  //   data['details'] = this.details;
  //   data['upcoming'] = this.upcoming;
  //   data['static_fire_date_utc'] = this.staticFireDateUtc;
  //   data['static_fire_date_unix'] = this.staticFireDateUnix;
  //   if (this.timeline != null) {
  //     data['timeline'] = this.timeline.toJson();
  //   }
  //   data['crew'] = this.crew;
  //   data['last_date_update'] = this.lastDateUpdate;
  //   data['last_ll_launch_date'] = this.lastLlLaunchDate;
  //   data['last_ll_update'] = this.lastLlUpdate;
  //   data['last_wiki_launch_date'] = this.lastWikiLaunchDate;
  //   data['last_wiki_revision'] = this.lastWikiRevision;
  //   data['last_wiki_update'] = this.lastWikiUpdate;
  //   data['launch_date_source'] = this.launchDateSource;
  //   return data;
  // }
}
