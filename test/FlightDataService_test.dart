import 'package:flutter_test/flutter_test.dart';
import 'package:launch_tracker_spacex/service_locator.dart';
import 'package:launch_tracker_spacex/src/resources/spacex_data_repository.dart';
import 'package:spacex_api/models/launch/launch.dart';
import 'setup_mock_api_responses.dart';

void main() {
  group('fetchFlightData', () {
    test('returns a flight if the http call completes successfully', () async {
      TestWidgetsFlutterBinding.ensureInitialized();
      registerServices(testing: true);
      SetupMockAPIResponses.MockDataAPIResponses();

      final _repository = getIt.get<SpaceXDataRepository>();

      expect(await _repository.fetchUpcomingFlights(), isA<List<Launch>>());

      expect(await _repository.fetchPastFlights(), isA<List<Launch>>());
    });

    test('throws an exception if the http call completes with an error', () {
      registerServices(testing: true);
      SetupMockAPIResponses.MockErrorAPIResponses();

      final _repository = SpaceXDataRepository();

      expect(() async => await _repository.fetchUpcomingFlights(),
          throwsException);
      expect(() async => await _repository.fetchPastFlights(), throwsException);
    });
  });
}
