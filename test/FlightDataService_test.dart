import 'package:flutter_test/flutter_test.dart';
import 'package:spacex_flights/EnvironmentConfig.dart';
import 'package:spacex_flights/service_locator.dart';
import 'package:spacex_flights/src/models/flight.dart';
import 'package:spacex_flights/src/resources/repository.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import './data/TestUpcomingFlightObj.dart';
import './data/TestPastFlightObj.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('fetchFlightData', () {
    test('returns a flight if the http call completes successfully', () async {
      TestWidgetsFlutterBinding.ensureInitialized();
      registerServices(testing: true);
      SharedPreferences.setMockInitialValues(
          {"user_theme_mode": "themeMode.system"});

      final _repository = Repository();
      final client = getIt.get<http.Client>();

      when(client.get('${EnvironmentConfig.BASE_URL}/launches/upcoming'))
          .thenAnswer((_) async =>
              http.Response(TestUpcomingFlightObj.flightJson, 200));

      expect(await _repository.fetchUpcomingFlights(), isA<List<Flight>>());

      when(client.get('${EnvironmentConfig.BASE_URL}/launches/past'))
          .thenAnswer(
              (_) async => http.Response(TestPastFlightObj.flightJson, 200));

      expect(await _repository.fetchPastFlights(), isA<List<Flight>>());
    });

    test('throws an exception if the http call completes with an error', () {
      registerServices(testing: true);

      final _repository = Repository();
      final client = getIt.get<http.Client>();

      when(client.get('${EnvironmentConfig.BASE_URL}/launches/upcoming'))
          .thenAnswer((_) async => http.Response('Internal Error', 500));

      when(client.get('${EnvironmentConfig.BASE_URL}/launches/past'))
          .thenAnswer((_) async => http.Response('Internal Error', 500));

      expect(() async => await _repository.fetchUpcomingFlights(),
          throwsException);
      expect(() async => await _repository.fetchPastFlights(), throwsException);
    });
  });
}
