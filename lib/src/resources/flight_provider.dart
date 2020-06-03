import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:spacex_flights/EnvironmentConfig.dart';
import 'package:spacex_flights/src/models/flights.dart';

class FlightProvider {
  static Flights parseFlights(String responseBody) {
    Flights flightList = Flights.fromJson(json.decode(responseBody));

    return flightList;
  }

  Future<Flights> fetchFlights(http.Client client) async {
    final response = await client.get("${EnvironmentConfig.BASE_URL}/launches");

    if (response.statusCode == 200) {
      return parseFlights(response.body);
    } else {
      throw Exception('Failed to load flights');
    }
  }
}
