import 'package:spacex_flights/src/models/second_stage.dart';

import 'fairings.dart';
import 'first_stage.dart';

class Rocket {
  String rocketId;
  String rocketName;
  String rocketType;
  FirstStage firstStage;
  SecondStage secondStage;
  Fairings fairings;

  Rocket(
      {this.rocketId,
      this.rocketName,
      this.rocketType,
      this.firstStage,
      this.secondStage,
      this.fairings});

  Rocket.fromJson(Map<String, dynamic> json) {
    rocketId = json['rocket_id'];
    rocketName = json['rocket_name'];
    rocketType = json['rocket_type'];
    firstStage = json['first_stage'] != null
        ? new FirstStage.fromJson(json['first_stage'])
        : null;
    secondStage = json['second_stage'] != null
        ? new SecondStage.fromJson(json['second_stage'])
        : null;
    fairings = json['fairings'] != null
        ? new Fairings.fromJson(json['fairings'])
        : null;
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['rocket_id'] = this.rocketId;
  //   data['rocket_name'] = this.rocketName;
  //   data['rocket_type'] = this.rocketType;
  //   if (this.firstStage != null) {
  //     data['first_stage'] = this.firstStage.toJson();
  //   }
  //   if (this.secondStage != null) {
  //     data['second_stage'] = this.secondStage.toJson();
  //   }
  //   if (this.fairings != null) {
  //     data['fairings'] = this.fairings.toJson();
  //   }
  //   return data;
  // }
}