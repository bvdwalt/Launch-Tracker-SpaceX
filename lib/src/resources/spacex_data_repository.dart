import 'dart:async';
import 'package:launch_tracker_spacex/service_locator.dart';
import 'package:launch_tracker_spacex/src/models/launchPad.dart';
import 'package:spacex_api/models/landpad.dart';
import 'package:spacex_api/models/launch/launch.dart';
import 'package:spacex_api/models/payload.dart';
import 'package:spacex_api/models/rocket/rocket.dart';
import 'package:spacex_api/spacex_api.dart';
import 'flight_provider.dart';

class SpaceXDataRepository {
  final flightProvider = getIt.get<FlightProvider>();
  final spaceXApi = getIt.get<SpaceXApi>();

  Future<List<Launch>> fetchUpcomingFlights() =>
      flightProvider.getAllLaunches(spaceXApi, upcoming: true);

  Future<List<Launch>> fetchPastFlights() =>
      flightProvider.getAllLaunches(spaceXApi, past: true);

  Future<List<Rocket>> fetchRockets() =>
      flightProvider.getAllRockets(spaceXApi);

  Future<List<Landpad>> fetchLandpads() =>
      flightProvider.getAllLandpads(spaceXApi);

  Future<List<Payload>> fetchPayloads() =>
      flightProvider.getAllPayloads(spaceXApi);

  Future<List<Launchpad>> fetchLaunchPads() =>
      flightProvider.getAllLaunchPads(spaceXApi);
}
