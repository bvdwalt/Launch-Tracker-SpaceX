import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/flights.dart';

class FlightProvider {
  final _baseUrl = 'https://api.spacexdata.com/v3';
  static Flights parseFlights(String responseBody) {
    Flights flightList = Flights.fromJson(json.decode(responseBody));

    return flightList;
  }

  Future<Flights> fetchFlights(http.Client client) async {
    final response = await client.get("$_baseUrl/launches");

    if (response.statusCode == 200) {
      return parseFlights(response.body);
    } else {
      throw Exception('Failed to load flights');
    }
  }
}
