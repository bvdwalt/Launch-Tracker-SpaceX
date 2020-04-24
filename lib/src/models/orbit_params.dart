class OrbitParams {
  String referenceSystem;
  String regime;
  double longitude;
  double semiMajorAxisKm;
  double eccentricity;
  double periapsisKm;
  double apoapsisKm;
  double inclinationDeg;
  double periodMin;
  double lifespanYears;
  String epoch;
  double meanMotion;
  double raan;
  double argOfPericenter;
  double meanAnomaly;

  OrbitParams(
      {this.referenceSystem,
      this.regime,
      this.longitude,
      this.semiMajorAxisKm,
      this.eccentricity,
      this.periapsisKm,
      this.apoapsisKm,
      this.inclinationDeg,
      this.periodMin,
      this.lifespanYears,
      this.epoch,
      this.meanMotion,
      this.raan,
      this.argOfPericenter,
      this.meanAnomaly});

  OrbitParams.fromJson(Map<String, dynamic> json) {
    referenceSystem = json['reference_system'];
    regime = json['regime'];
    longitude = json['longitude']?.toDouble();
    semiMajorAxisKm = json['semi_major_axis_km']?.toDouble();
    eccentricity = json['eccentricity']?.toDouble();
    periapsisKm = json['periapsis_km']?.toDouble();
    apoapsisKm = json['apoapsis_km']?.toDouble();
    inclinationDeg = json['inclination_deg']?.toDouble();
    periodMin = json['period_min']?.toDouble();
    lifespanYears = json['lifespan_years']?.toDouble();
    epoch = json['epoch'];
    meanMotion = json['mean_motion']?.toDouble();
    raan = json['raan']?.toDouble();
    argOfPericenter = json['arg_of_pericenter']?.toDouble();
    meanAnomaly = json['mean_anomaly']?.toDouble();
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['reference_system'] = this.referenceSystem;
  //   data['regime'] = this.regime;
  //   data['longitude'] = this.longitude;
  //   data['semi_major_axis_km'] = this.semiMajorAxisKm;
  //   data['eccentricity'] = this.eccentricity;
  //   data['periapsis_km'] = this.periapsisKm;
  //   data['apoapsis_km'] = this.apoapsisKm;
  //   data['inclination_deg'] = this.inclinationDeg;
  //   data['period_min'] = this.periodMin;
  //   data['lifespan_years'] = this.lifespanYears;
  //   data['epoch'] = this.epoch;
  //   data['mean_motion'] = this.meanMotion;
  //   data['raan'] = this.raan;
  //   data['arg_of_pericenter'] = this.argOfPericenter;
  //   data['mean_anomaly'] = this.meanAnomaly;
  //   return data;
  // }
}
