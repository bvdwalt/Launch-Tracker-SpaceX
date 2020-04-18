class Fairings {
  bool reused;
  bool recoveryAttempt;
  bool recovered;
  String ship;

  Fairings({this.reused, this.recoveryAttempt, this.recovered, this.ship});

  Fairings.fromJson(Map<String, dynamic> json) {
    reused = json['reused'];
    recoveryAttempt = json['recovery_attempt'];
    recovered = json['recovered'];
    ship = json['ship'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reused'] = this.reused;
    data['recovery_attempt'] = this.recoveryAttempt;
    data['recovered'] = this.recovered;
    data['ship'] = this.ship;
    return data;
  }
}