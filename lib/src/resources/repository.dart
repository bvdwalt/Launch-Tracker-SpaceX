import 'dart:async';
import '../../service_locator.dart';
import '../models/flights.dart';
import 'flight_provider.dart';
import 'package:http/http.dart' as http;

class Repository {
  final flightProvider = getIt.get<FlightProvider>();
  final client = getIt.get<http.Client>();

  Future<Flights> fetchAllFlights() => flightProvider.fetchFlights(client);
}
