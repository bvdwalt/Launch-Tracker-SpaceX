import 'dart:convert';
import 'package:http/http.dart' show Client;
import '../models/flights.dart';

class FlightProvider {
  Client _client = Client();
  final _baseUrl = 'https://api.spacexdata.com/v3';
  Flights parseFlights(String responseBody) {
    Flights flightList = Flights.fromJson(json.decode(responseBody));

    return flightList;
  }

  Future<Flights> fetchFlights() async {
    final response = await _client.get("$_baseUrl/launches");

    if (response.statusCode == 200) {
      return parseFlights(response.body);
    } else {
      throw Exception('Failed to load flights');
    }
  }
}
