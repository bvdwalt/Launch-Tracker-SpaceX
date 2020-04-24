import 'payloads.dart';

class SecondStage {
  int block;
  List<Payloads> payloads;

  SecondStage({this.block, this.payloads});

  SecondStage.fromJson(Map<String, dynamic> json) {
    block = json['block'];
    if (json['payloads'] != null) {
      payloads = new List<Payloads>();
      json['payloads'].forEach((v) {
        payloads.add(new Payloads.fromJson(v));
      });
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['block'] = this.block;
  //   if (this.payloads != null) {
  //     data['payloads'] = this.payloads.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}
