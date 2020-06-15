import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:spacex_flights/EnvironmentConfig.dart';
import 'package:spacex_flights/src/models/flight.dart';

import 'app_exception.dart';

class FlightProvider {
  static List<Flight> parseFlights(List<dynamic> list) {
    List<Flight> flightList = list.map((i) => Flight.fromJson(i)).toList();
    return flightList;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

  Future<List<Flight>> fetchUpcomingFlights(http.Client client) async {
    final response =
        await client.get("${EnvironmentConfig.BASE_URL}/launches/upcoming");

    var responseJson = _returnResponse(response);

    return parseFlights(responseJson);
  }

  Future<List<Flight>> fetchPastFlights(http.Client client) async {
    final response =
        await client.get("${EnvironmentConfig.BASE_URL}/launches/past");

    var responseJson = _returnResponse(response);

    List<Flight> flights = parseFlights(responseJson);
    flights.sort((a, b) => b.flightNumber.compareTo(a.flightNumber));

    return flights;
  }
}
