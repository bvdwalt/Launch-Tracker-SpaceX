import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:spacex_flights/EnvironmentConfig.dart';
import 'package:spacex_flights/service_locator.dart';
import 'package:spacex_flights/src/resources/repository.dart';
import 'package:spacex_flights/src/models/flights.dart';
import 'package:mockito/mockito.dart';
import 'TestFlightObj.dart';
import 'package:http/http.dart' as http;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  group('fetchFlightData', () {
    test('returns a flight if the http call completes successfully', () async {
      registerServices(testing: true);

      final _repository = Repository();
      final client = getIt.get<http.Client>();

      when(client.get('${EnvironmentConfig.BASE_URL}/launches')).thenAnswer(
          (_) async => http.Response(TestFlightObj.flightJson, 200));

      expect(await _repository.fetchAllFlights(), isA<Flights>());
    });

    test('throws an exception if the http call completes with an error', () {
      registerServices(testing: true);

      final _repository = Repository();
      final client = getIt.get<http.Client>();

      when(client.get('${EnvironmentConfig.BASE_URL}/launches'))
          .thenAnswer((_) async => http.Response('Internal Error', 500));

      expect(_repository.fetchAllFlights(), throwsException);
    });
  });
}
