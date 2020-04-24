import 'dart:async';
import '../models/flights.dart';
import 'flight_provider.dart';

class Repository {
  final flightProvider = FlightProvider();

  Future<Flights> fetchAllFlights() => flightProvider.fetchFlights();
}
