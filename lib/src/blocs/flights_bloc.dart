import 'dart:io';

import 'package:rxdart/rxdart.dart';
import 'package:spacex_flights/src/models/flight.dart';
import 'package:spacex_flights/src/resources/api_response.dart';
import 'package:spacex_flights/src/resources/repository.dart';

class FlightsBloc {
  final _repository = Repository();
  final _upcomingFlightsFetcher = ReplaySubject<ApiResponse<List<Flight>>>();
  final _pastFlightsFetcher = ReplaySubject<ApiResponse<List<Flight>>>();

  Stream<ApiResponse<List<Flight>>> get upcomingFlights =>
      _upcomingFlightsFetcher.stream;
  Stream<ApiResponse<List<Flight>>> get pastFlights =>
      _pastFlightsFetcher.stream;

  fetchUpcomingFlights() async {
    _upcomingFlightsFetcher
        .add(ApiResponse.loading('Fetching Upcoming Flights'));
    try {
      List<Flight> flights = await _repository.fetchUpcomingFlights();
      _upcomingFlightsFetcher.add(ApiResponse.completed(flights));
    } on SocketException catch (ex) {
      if (ex.message.startsWith("Failed host lookup:")) {
        _upcomingFlightsFetcher.add(ApiResponse.error(
            "No connection, please ensure you are connected to a network"));
      }
    } catch (e) {
      _upcomingFlightsFetcher.add(ApiResponse.error(
          "Unexpected error occurred while fetching flights"));
    }
  }

  fetchPastFlights() async {
    _pastFlightsFetcher.add(ApiResponse.loading('Fetching Past Flights'));
    try {
      List<Flight> flights = await _repository.fetchPastFlights();
      _pastFlightsFetcher.add(ApiResponse.completed(flights));
    } on SocketException catch (ex) {
      if (ex.message.startsWith("Failed host lookup:")) {
        _pastFlightsFetcher.add(ApiResponse.error(
            "No connection, please ensure you are connected to a network"));
      }
    } catch (e) {
      _pastFlightsFetcher.add(ApiResponse.error(
          "Unexpected error occurred while fetching flights"));
    }
  }

  dispose() {
    _upcomingFlightsFetcher.close();
    _pastFlightsFetcher.close();
  }
}
