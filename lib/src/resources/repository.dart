import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:spacex_flights/service_locator.dart';
import 'package:spacex_flights/src/models/flight.dart';

import 'flight_provider.dart';

class Repository {
  final flightProvider = getIt.get<FlightProvider>();
  final client = getIt.get<http.Client>();

  Future<List<Flight>> fetchUpcomingFlights() => flightProvider.fetchUpcomingFlights(client);

  Future<List<Flight>> fetchPastFlights() => flightProvider.fetchPastFlights(client);
}
