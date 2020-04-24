// import 'package:flutter_test/flutter_test.dart';
// import 'package:spacex_flights/DTOs/flight.dart';
// import 'package:spacex_flights/Services/FlightDataService.dart';

// import 'package:matcher/matcher.dart';
// import 'package:mockito/mockito.dart';
// import 'package:http/http.dart' as http;

// import 'TestFlightObj.dart';

// class MockClient extends Mock implements http.Client {}

// void main() {
//   group('fetchFlightData', () {
//     test('returns a flight if the http call completes successfully', () async {
//       final client = MockClient();

//       when(client.get('https://api.spacexdata.com/v3/launches'))
//           .thenAnswer((_) async => http.Response(TestFlightObj.flightJson, 200));

//       expect(await FlightDataService.fetchFlights(client),
//           TypeMatcher<List<Flight>>());
//     });

//     test('throws an exception if the http call completes with an error', () {
//       final client = MockClient();

//       when(client.get('https://api.spacexdata.com/v3/launches'))
//           .thenAnswer((_) async => http.Response('Internal Error', 500));

//       expect(FlightDataService.fetchFlights(client), throwsException);
//     });
//   });
// }
