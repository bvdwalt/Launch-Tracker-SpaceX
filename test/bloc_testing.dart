import 'package:flutter_test/flutter_test.dart';
import 'package:launch_tracker_spacex/service_locator.dart';
import 'package:launch_tracker_spacex/src/blocs/flights_bloc.dart';
import 'package:spacex_api/models/launch/launch.dart';
import 'package:spacex_api/models/rocket/rocket.dart';

void main() async {
  group("BloC testing", () {
    test("Flights BLoC testing", () async {
      registerServices(testing: true);

      final flightsBloc = getIt.get<SpaceXDataBloc>();
      flightsBloc.fetchUpcomingFlights();
      flightsBloc.fetchPastFlights();
      flightsBloc.fetchRockets();

      flightsBloc.upcomingFlights.listen(expectAsync1((value) {
        expect(value, isInstanceOf<List<Launch>>());
      }));

      flightsBloc.pastFlights.listen(expectAsync1((value) {
        expect(value, isInstanceOf<List<Launch>>());
      }));

      flightsBloc.rockets.listen(expectAsync1((value) {
        expect(value, isInstanceOf<List<Rocket>>());
      }));
    });
  });
}
