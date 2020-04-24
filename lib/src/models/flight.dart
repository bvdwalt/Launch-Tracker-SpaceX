import 'launch_site.dart';
import 'links.dart';
import 'rocket.dart';
import 'telemetry.dart';
import 'timeline.dart';

class Flight {
  int flightNumber;
  String missionName;
  List<String> missionId;
  String launchYear;
  int launchDateUnix;
  DateTime launchDateUtc;
  DateTime launchDateLocal;
  bool isTentative;
  String tentativeMaxPrecision;
  bool tbd;
  int launchWindow;
  Rocket rocket;
  List<String> ships;
  Telemetry telemetry;
  LaunchSite launchSite;
  bool launchSuccess;
  Links links;
  String details;
  bool upcoming;
  DateTime staticFireDateUtc;
  int staticFireDateUnix;
  Timeline timeline;
  List<String> crew;
  DateTime lastDateUpdate;
  DateTime lastLlLaunchDate;
  DateTime lastLlUpdate;
  DateTime lastWikiLaunchDate;
  String lastWikiRevision;
  DateTime lastWikiUpdate;
  String launchDateSource;

  Flight(
      {this.flightNumber,
      this.missionName,
      this.missionId,
      this.launchYear,
      this.launchDateUnix,
      this.launchDateUtc,
      this.launchDateLocal,
      this.isTentative,
      this.tentativeMaxPrecision,
      this.tbd,
      this.launchWindow,
      this.rocket,
      this.ships,
      this.telemetry,
      this.launchSite,
      this.launchSuccess,
      this.links,
      this.details,
      this.upcoming,
      this.staticFireDateUtc,
      this.staticFireDateUnix,
      this.timeline,
      this.crew,
      this.lastDateUpdate,
      this.lastLlLaunchDate,
      this.lastLlUpdate,
      this.lastWikiLaunchDate,
      this.lastWikiRevision,
      this.lastWikiUpdate,
      this.launchDateSource});

  Flight.fromJson(Map<String, dynamic> json) {
    flightNumber = json['flight_number'];
    missionName = json['mission_name'];
    missionId = json['mission_id'].cast<String>();
    launchYear = json['launch_year'];
    launchDateUnix = json['launch_date_unix'];
    launchDateUtc = json['launch_date_utc'] != null ? DateTime.parse(json['launch_date_utc']) : null;
    launchDateLocal = json['launch_date_local'] != null ? DateTime.parse(json['launch_date_local']) : null;
    isTentative = json['is_tentative'];
    tentativeMaxPrecision = json['tentative_max_precision'];
    tbd = json['tbd'];
    launchWindow = json['launch_window'];
    rocket =
        json['rocket'] != null ? new Rocket.fromJson(json['rocket']) : null;
    ships = json['ships'].cast<String>();
    telemetry = json['telemetry'] != null
        ? new Telemetry.fromJson(json['telemetry'])
        : null;
    launchSite = json['launch_site'] != null
        ? new LaunchSite.fromJson(json['launch_site'])
        : null;
    launchSuccess = json['launch_success'];
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    details = json['details'];
    upcoming = json['upcoming'];
    staticFireDateUtc = json['static_fire_date_utc'] != null ? DateTime.parse(json['static_fire_date_utc']) : null;
    staticFireDateUnix = json['static_fire_date_unix'];
    timeline = json['timeline'] != null
        ? new Timeline.fromJson(json['timeline'])
        : null;
    crew = json['crew']?.cast<String>();
    lastDateUpdate = json['last_date_update'] != null ? DateTime.parse(json['last_date_update']) : null;
    lastLlLaunchDate = json['last_ll_launch_date'] != null ? DateTime.parse(json['last_ll_launch_date']) : null;
    lastLlUpdate = json['last_ll_update'] != null ? DateTime.parse(json['last_ll_update']) : null;
    lastWikiLaunchDate = json['last_wiki_launch_date'] != null ? DateTime.parse(json['last_wiki_launch_date']) : null;
    lastWikiRevision = json['last_wiki_revision'];
    lastWikiUpdate = json['last_wiki_update'] != null ? DateTime.parse(json['last_wiki_update']) : null;
    launchDateSource = json['launch_date_source'];
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