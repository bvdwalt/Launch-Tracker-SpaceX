import 'dart:convert';
import 'package:spacex_flights/DTOs/flight.dart';
import 'package:http/http.dart' as http;

class FlightDataService {
  static List<Flight> parseFlight(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Flight>((json) => Flight.fromJson(json)).toList();
  }

  static Future<List<Flight>> fetchFlightData(http.Client client) async {
    final response = await client.get('https://api.spacexdata.com/v3/launches');

    return parseFlight(response.body);
  }
}
