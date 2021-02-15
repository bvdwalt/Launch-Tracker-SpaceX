import 'dart:io';
import 'package:launch_tracker_spacex/service_locator.dart';
import 'package:launch_tracker_spacex/src/models/launchPad.dart';
import 'package:launch_tracker_spacex/src/resources/api_response.dart';
import 'package:launch_tracker_spacex/src/resources/spacex_data_repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:spacex_api/models/landpad.dart';
import 'package:spacex_api/models/launch/launch.dart';
import 'package:spacex_api/models/payload.dart';
import 'package:spacex_api/models/rocket/rocket.dart';

class SpaceXDataBloc {
  final _repository = getIt.get<SpaceXDataRepository>();

  final _upcomingFlightsFetcher = BehaviorSubject<ApiResponse<List<Launch>>>();
  final _pastFlightsFetcher = BehaviorSubject<ApiResponse<List<Launch>>>();
  final _rocketsFetcher = BehaviorSubject<ApiResponse<List<Rocket>>>();
  final _landPadsFetcher = BehaviorSubject<ApiResponse<List<Landpad>>>();
  final _payloadsFetcher = BehaviorSubject<ApiResponse<List<Payload>>>();
  final _launchpadsFetcher = BehaviorSubject<ApiResponse<List<Launchpad>>>();

  final _cachedRockets = new List<Rocket>();
  final _cachedLandPads = new List<Landpad>();
  final _cachedPayloads = new List<Payload>();
  final _cachedLaunchpads = new List<Launchpad>();

  Stream<ApiResponse<List<Launch>>> get upcomingFlights =>
      _upcomingFlightsFetcher.stream;
  Stream<ApiResponse<List<Launch>>> get pastFlights =>
      _pastFlightsFetcher.stream;
  Stream<ApiResponse<List<Rocket>>> get rockets => _rocketsFetcher.stream;
  Stream<ApiResponse<List<Payload>>> get payloads => _payloadsFetcher.stream;
  Stream<ApiResponse<List<Launchpad>>> get launchpads =>
      _launchpadsFetcher.stream;

  fetchUpcomingFlights() async {
    try {
      _upcomingFlightsFetcher
          .add(ApiResponse.loading('Fetching Upcoming Flights'));
      List<Launch> flights = await _repository.fetchUpcomingFlights();
      _upcomingFlightsFetcher.add(ApiResponse.completed(flights));
    } on SocketException catch (ex) {
      if (ex.message.startsWith("Failed host lookup:")) {
        _upcomingFlightsFetcher.add(ApiResponse.error(
            "No connection, please ensure you are connected to a network"));
      }
    } catch (e) {
      _upcomingFlightsFetcher.add(ApiResponse.error(
          "Unexpected error occurred while fetching flights"));
    }
  }

  fetchPastFlights() async {
    try {
      _pastFlightsFetcher.add(ApiResponse.loading('Fetching Past Flights'));
      List<Launch> flights = await _repository.fetchPastFlights();
      _pastFlightsFetcher.add(ApiResponse.completed(flights));
    } on SocketException catch (ex) {
      if (ex.message.startsWith("Failed host lookup:")) {
        _pastFlightsFetcher.add(ApiResponse.error(
            "No connection, please ensure you are connected to a network"));
      }
    } catch (e) {
      _pastFlightsFetcher.add(ApiResponse.error(
          "Unexpected error occurred while fetching flights"));
    }
  }

  fetchRockets() async {
    try {
      List<Rocket> rockets = await _repository.fetchRockets();

      if (_cachedRockets.length == 0 ||
          _cachedRockets.length != rockets.length) {
        _rocketsFetcher.add(ApiResponse.loading('Fetching Rockets'));
        _cachedRockets.clear();
        _cachedRockets.addAll(rockets);
        _rocketsFetcher.add(ApiResponse.completed(rockets));
      }
    } on SocketException catch (ex) {
      if (ex.message.startsWith("Failed host lookup:")) {
        _rocketsFetcher.add(ApiResponse.error(
            "No connection, please ensure you are connected to a network"));
      }
    } catch (e) {
      _rocketsFetcher.add(ApiResponse.error(
          "Unexpected error occurred while fetching Rockets"));
    }
  }

  fetchLandPads() async {
    try {
      List<Landpad> landPads = await _repository.fetchLandpads();

      if (_cachedLandPads.length == 0 ||
          _cachedLandPads.length != landPads.length) {
        _landPadsFetcher.add(ApiResponse.loading('Fetching LandPads'));
        _cachedLandPads.clear();
        _cachedLandPads.addAll(landPads);
        _landPadsFetcher.add(ApiResponse.completed(landPads));
      }
    } on SocketException catch (ex) {
      if (ex.message.startsWith("Failed host lookup:")) {
        _landPadsFetcher.add(ApiResponse.error(
            "No connection, please ensure you are connected to a network"));
      }
    } catch (e) {
      _landPadsFetcher.add(ApiResponse.error(
          "Unexpected error occurred while fetching LandPads"));
    }
  }

  fetchPayloads() async {
    try {
      List<Payload> payloads = await _repository.fetchPayloads();

      if (_cachedPayloads.length == 0 ||
          _cachedPayloads.length != _cachedPayloads.length) {
        _payloadsFetcher.add(ApiResponse.loading('Fetching payloads'));
        _cachedPayloads.clear();
        _cachedPayloads.addAll(payloads);
        _payloadsFetcher.add(ApiResponse.completed(payloads));
      }
    } on SocketException catch (ex) {
      if (ex.message.startsWith("Failed host lookup:")) {
        _payloadsFetcher.add(ApiResponse.error(
            "No connection, please ensure you are connected to a network"));
      }
    } catch (e) {
      _payloadsFetcher.add(ApiResponse.error(
          "Unexpected error occurred while fetching payloads"));
    }
  }

  fetchLaunchpads() async {
    try {
      List<Launchpad> launchpads = await _repository.fetchLaunchPads();

      if (_cachedLaunchpads.length == 0 ||
          _cachedLaunchpads.length != _cachedLaunchpads.length) {
        _launchpadsFetcher.add(ApiResponse.loading('Fetching Launchpads'));

        _cachedLaunchpads.clear();
        _cachedLaunchpads.addAll(launchpads);
        _launchpadsFetcher.add(ApiResponse.completed(launchpads));
      }
    } on SocketException catch (ex) {
      if (ex.message.startsWith("Failed host lookup:")) {
        _launchpadsFetcher.add(ApiResponse.error(
            "No connection, please ensure you are connected to a network"));
      }
    } catch (e) {
      _launchpadsFetcher.add(ApiResponse.error(
          "Unexpected error occurred while fetching aunchpads"));
    }
  }

  dispose() {
    _upcomingFlightsFetcher.close();
    _pastFlightsFetcher.close();
    _rocketsFetcher.close();
    _landPadsFetcher.close();
    _payloadsFetcher.close();
    _launchpadsFetcher.close();
    _cachedRockets.clear();
    _cachedLandPads.clear();
    _cachedPayloads.clear();
    _cachedLaunchpads.clear();
  }
}
