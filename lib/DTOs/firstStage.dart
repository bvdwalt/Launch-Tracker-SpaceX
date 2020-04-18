import 'package:spacex_flights/DTOs/cores.dart';

class FirstStage {
  List<Cores> cores;

  FirstStage({this.cores});

  FirstStage.fromJson(Map<String, dynamic> json) {
    if (json['cores'] != null) {
      cores = new List<Cores>();
      json['cores'].forEach((v) {
        cores.add(new Cores.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cores != null) {
      data['cores'] = this.cores.map((v) => v.toJson()).toList();
    }
    return data;
  }
}