import 'dart:convert';
import 'package:spacex_flights/DTOs/flight.dart';
import 'package:http/http.dart';
//import 'package:flutter/services.dart' show rootBundle;

class FlightDataService {
  Client _client;
  FlightDataService() {
    _client = new Client();
  }
  // static Future<List<Flight>> loadData() async {
  //   var result = await _loadData();

  //   final parsed = await json.decode(result);
  //   final flights =
  //       parsed.map<Flight>((json) => Flight.fromJson(json)).toList();

  //   return flights;
  // }

  // static Future<String> _loadData() async {
  //   return await rootBundle.loadString('assets/data.json');
  // }

  // A function that converts a response body into a List<Photo>.
  List<Flight> parseFlight(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Flight>((json) => Flight.fromJson(json)).toList();
  }

  Future<List<Flight>> fetchFlightData() async {
    final response = await _client.get('https://api.spacexdata.com/v3/launches');

    return parseFlight(response.body);
  }
}
