import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/flights.dart';

class FlightsBloc {
  final _repository = Repository();
  final _flightsFetcher = PublishSubject<Flights>();

  Stream<Flights> get allFlights => _flightsFetcher.stream;

  fetchAllFlights() async {
    Flights flights = await _repository.fetchAllFlights();
    _flightsFetcher.sink.add(flights);
  }

  dispose() {
    _flightsFetcher.close();
  }
}

final bloc = FlightsBloc();