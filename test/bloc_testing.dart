import 'package:flutter_test/flutter_test.dart';
import 'package:spacex_flights/service_locator.dart';
import 'package:spacex_flights/src/blocs/flights_bloc.dart';
import 'package:spacex_flights/src/models/flights.dart';

void main() async {
  group("BloC testing", () {
    test("Flights BLoC testing", () async {
      registerServices(testing: true);

      final flightsBloc = FlightsBloc();
      flightsBloc.fetchAllFlights();
      flightsBloc.flights.listen(expectAsync1((value) {
        expect(value, isInstanceOf<Flights>());
      }));
    });
  });
}
