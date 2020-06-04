import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:spacex_flights/EnvironmentConfig.dart';
import 'package:spacex_flights/src/models/flight.dart';

class FlightProvider {
  static List<Flight> parseFlights(String responseBody) {
    List<Flight> flightList = (json.decode(responseBody) as List)
        .map((i) => Flight.fromJson(i))
        .toList();
    return flightList;
  }

  Future<List<Flight>> fetchUpcomingFlights(http.Client client) async {
    final response =
        await client.get("${EnvironmentConfig.BASE_URL}/launches/upcoming");

    if (response.statusCode == 200) {
      return parseFlights(response.body);
    } else {
      throw Exception('Failed to load upcoming flights');
    }
  }

  Future<List<Flight>> fetchPastFlights(http.Client client) async {
    final response =
        await client.get("${EnvironmentConfig.BASE_URL}/launches/past");

    if (response.statusCode == 200) {
      List<Flight> flights = parseFlights(response.body);
      flights.sort((a, b) => b.flightNumber.compareTo(a.flightNumber));

      return flights;
    } else {
      throw Exception('Failed to load past flights');
    }
  }
}
