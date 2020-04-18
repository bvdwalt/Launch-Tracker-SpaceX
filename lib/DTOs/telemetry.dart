class Telemetry {
  String flightClub;

  Telemetry({this.flightClub});

  Telemetry.fromJson(Map<String, dynamic> json) {
    flightClub = json['flight_club'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['flight_club'] = this.flightClub;
    return data;
  }
}