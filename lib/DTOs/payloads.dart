import 'orbitParams.dart';

class Payloads {
  String payloadId;
  List<int> noradId;
  String capSerial;
  bool reused;
  List<String> customers;
  String nationality;
  String manufacturer;
  String payloadType;
  double payloadMassKg;
  double payloadMassLbs;
  String orbit;
  OrbitParams orbitParams;
  double massReturnedKg;
  double massReturnedLbs;
  int flightTimeSec;
  String cargoManifest;

  Payloads(
      {this.payloadId,
      this.noradId,
      this.capSerial,
      this.reused,
      this.customers,
      this.nationality,
      this.manufacturer,
      this.payloadType,
      this.payloadMassKg,
      this.payloadMassLbs,
      this.orbit,
      this.orbitParams,
      this.massReturnedKg,
      this.massReturnedLbs,
      this.flightTimeSec,
      this.cargoManifest});

  Payloads.fromJson(Map<String, dynamic> json) {
    payloadId = json['payload_id'];
    noradId = json['norad_id'].cast<int>();
    capSerial = json['cap_serial'];
    reused = json['reused'];
    customers = json['customers'].cast<String>();
    nationality = json['nationality'];
    manufacturer = json['manufacturer'];
    payloadType = json['payload_type'];
    payloadMassKg = json['payload_mass_kg']?.toDouble();
    payloadMassLbs = json['payload_mass_lbs']?.toDouble();
    orbit = json['orbit'];
    orbitParams = json['orbit_params'] != null
        ? new OrbitParams.fromJson(json['orbit_params'])
        : null;
    massReturnedKg = json['mass_returned_kg']?.toDouble();
    massReturnedLbs = json['mass_returned_lbs']?.toDouble();
    flightTimeSec = json['flight_time_sec'];
    cargoManifest = json['cargo_manifest'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['payload_id'] = this.payloadId;
    data['norad_id'] = this.noradId;
    data['cap_serial'] = this.capSerial;
    data['reused'] = this.reused;
    data['customers'] = this.customers;
    data['nationality'] = this.nationality;
    data['manufacturer'] = this.manufacturer;
    data['payload_type'] = this.payloadType;
    data['payload_mass_kg'] = this.payloadMassKg;
    data['payload_mass_lbs'] = this.payloadMassLbs;
    data['orbit'] = this.orbit;
    if (this.orbitParams != null) {
      data['orbit_params'] = this.orbitParams.toJson();
    }
    data['mass_returned_kg'] = this.massReturnedKg;
    data['mass_returned_lbs'] = this.massReturnedLbs;
    data['flight_time_sec'] = this.flightTimeSec;
    data['cargo_manifest'] = this.cargoManifest;
    return data;
  }
}