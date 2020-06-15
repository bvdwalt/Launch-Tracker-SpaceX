import 'package:flutter_test/flutter_test.dart';
import 'package:spacex_flights/service_locator.dart';
import 'package:spacex_flights/src/blocs/flights_bloc.dart';
import 'package:spacex_flights/src/models/flight.dart';

void main() async {
  group("BloC testing", () {
    test("Flights BLoC testing", () async {
      registerServices(testing: true);

      final flightsBloc = getIt.get<FlightsBloc>();
      flightsBloc.fetchUpcomingFlights();
      flightsBloc.upcomingFlights.listen(expectAsync1((value) {
        print(value.toString());
        expect(value, isInstanceOf<List<Flight>>());
      }));

      flightsBloc.fetchPastFlights();
      flightsBloc.pastFlights.listen(expectAsync1((value) {
        expect(value, isInstanceOf<List<Flight>>());
      }));
    });
  });
}
