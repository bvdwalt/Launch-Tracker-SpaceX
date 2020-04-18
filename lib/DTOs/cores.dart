class Cores {
  String coreSerial;
  int flight;
  int block;
  bool gridfins;
  bool legs;
  bool reused;
  bool landSuccess;
  bool landingIntent;
  String landingType;
  String landingVehicle;

  Cores(
      {this.coreSerial,
      this.flight,
      this.block,
      this.gridfins,
      this.legs,
      this.reused,
      this.landSuccess,
      this.landingIntent,
      this.landingType,
      this.landingVehicle});

  Cores.fromJson(Map<String, dynamic> json) {
    coreSerial = json['core_serial'];
    flight = json['flight'];
    block = json['block'];
    gridfins = json['gridfins'];
    legs = json['legs'];
    reused = json['reused'];
    landSuccess = json['land_success'];
    landingIntent = json['landing_intent'];
    landingType = json['landing_type'];
    landingVehicle = json['landing_vehicle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['core_serial'] = this.coreSerial;
    data['flight'] = this.flight;
    data['block'] = this.block;
    data['gridfins'] = this.gridfins;
    data['legs'] = this.legs;
    data['reused'] = this.reused;
    data['land_success'] = this.landSuccess;
    data['landing_intent'] = this.landingIntent;
    data['landing_type'] = this.landingType;
    data['landing_vehicle'] = this.landingVehicle;
    return data;
  }
}