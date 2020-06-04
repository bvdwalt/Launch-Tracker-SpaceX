import 'package:rxdart/rxdart.dart';
import 'package:spacex_flights/src/models/flight.dart';
import 'package:spacex_flights/src/resources/repository.dart';

class FlightsBloc {
  final _repository = Repository();
  final _upcomingFlightsFetcher = ReplaySubject<List<Flight>>();
  final _pastFlightsFetcher = ReplaySubject<List<Flight>>();

  Stream<List<Flight>> get upcomingFlights => _upcomingFlightsFetcher.stream;
  Stream<List<Flight>> get pastFlights => _pastFlightsFetcher.stream;

  fetchUpcomingFlights() async {
    List<Flight> flights = await _repository.fetchUpcomingFlights();
    _upcomingFlightsFetcher.sink.add(flights);
  }

  fetchPastFlights() async {
    List<Flight> flights = await _repository.fetchPastFlights();
    _pastFlightsFetcher.sink.add(flights);
  }

  dispose() {
    _upcomingFlightsFetcher.close();
    _pastFlightsFetcher.close();
  }
}

final bloc = FlightsBloc();