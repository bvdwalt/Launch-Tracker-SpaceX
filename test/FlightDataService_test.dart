import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:launch_tracker_spacex/EnvironmentConfig.dart';
import 'package:launch_tracker_spacex/service_locator.dart';
import 'package:launch_tracker_spacex/src/resources/spacex_data_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import './data/TestUpcomingFlightObj.dart';
import './data/TestPastFlightObj.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spacex_api/models/launch/launch.dart';

void main() {
  group('fetchFlightData', () {
    test('returns a flight if the http call completes successfully', () async {
      TestWidgetsFlutterBinding.ensureInitialized();
      registerServices(testing: true);
      SharedPreferences.setMockInitialValues(
          {"user_theme_mode": "themeMode.system"});

      final _repository = getIt.get<SpaceXDataRepository>();
      final client = getIt.get<http.Client>();

      when(client.get('${EnvironmentConfig.BASE_URL}/launches/upcoming'))
          .thenAnswer((_) async =>
              http.Response(TestUpcomingFlightObj.flightJson, 200));

      expect(await _repository.fetchUpcomingFlights(), isA<List<Launch>>());

      when(client.get('${EnvironmentConfig.BASE_URL}/launches/past'))
          .thenAnswer(
              (_) async => http.Response(TestPastFlightObj.flightJson, 200));

      expect(await _repository.fetchPastFlights(), isA<List<Launch>>());
    });

    test('throws an exception if the http call completes with an error', () {
      registerServices(testing: true);

      final _repository = SpaceXDataRepository();
      final client = getIt.get<http.Client>();

      when(client.get('${EnvironmentConfig.BASE_URL}/launches/upcoming'))
          .thenAnswer(
              (_) async => throw SocketException("Failed host lookup:"));

      when(client.get('${EnvironmentConfig.BASE_URL}/launches/past'))
          .thenAnswer(
              (_) async => throw SocketException("Failed host lookup:"));

      expect(() async => await _repository.fetchUpcomingFlights(),
          throwsException);
      expect(() async => await _repository.fetchPastFlights(), throwsException);
    });
  });
}
