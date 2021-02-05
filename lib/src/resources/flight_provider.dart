import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:launch_tracker_spacex/src/models/launchPad.dart';
import 'package:spacex_api/models/landpad.dart';
import 'package:spacex_api/models/launch/launch.dart';
import 'package:spacex_api/models/payload.dart';
import 'package:spacex_api/models/rocket/rocket.dart';
import 'package:spacex_api/spacex_api.dart';
import 'app_exception.dart';

class FlightProvider {
  static List<Launch> parseLaunches(List<dynamic> list) {
    List<Launch> flightList = list.map((i) => Launch.fromJson(i)).toList();
    return flightList;
  }

  static List<Rocket> parseRockets(List<dynamic> list) {
    List<Rocket> rocketList = list.map((i) => Rocket.fromJson(i)).toList();
    return rocketList;
  }

  static List<Landpad> parselandPads(List<dynamic> list) {
    List<Landpad> parsedList = list.map((i) => Landpad.fromJson(i)).toList();
    return parsedList;
  }

  static List<Payload> parsePayloads(List<dynamic> list) {
    List<Payload> parsedList = list.map((i) => Payload.fromJson(i)).toList();
    return parsedList;
  }

  static List<Launchpad> parseLaunchpads(List<dynamic> list) {
    List<Launchpad> parsedList =
        list.map((i) => Launchpad.fromJson(i)).toList();
    return parsedList;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

  Future<List<Launch>> getAllLaunches(SpaceXApi api,
      {bool upcoming = false, bool past = false}) async {
    final response = await api.getAllLaunches();

    var responseJson = _returnResponse(response);

    List<Launch> launches = parseLaunches(responseJson);

    if (upcoming) {
      launches.sort((a, b) => a.flightNumber.compareTo(b.flightNumber));
      return launches.where((launch) => launch.upcoming).toList();
    } else if (past) {
      launches.sort((a, b) => b.flightNumber.compareTo(a.flightNumber));
      return launches.where((launch) => !launch.upcoming).toList();
    }
    return launches;
  }

  Future<List<Rocket>> getAllRockets(SpaceXApi api) async {
    final response = await api.getAllRockets();

    var responseJson = _returnResponse(response);

    List<Rocket> rockets = parseRockets(responseJson);

    return rockets;
  }

  Future<List<Landpad>> getAllLandpads(SpaceXApi api) async {
    final response = await api.getAllLandpads();

    var responseJson = _returnResponse(response);

    List<Landpad> landPads = parselandPads(responseJson);

    return landPads;
  }

  Future<List<Payload>> getAllPayloads(SpaceXApi api) async {
    final response = await api.getAllPayloads();

    var responseJson = _returnResponse(response);

    List<Payload> payloads = parsePayloads(responseJson);

    return payloads;
  }

  Future<List<Launchpad>> getAllLaunchPads(SpaceXApi api) async {
    final response = await api.getAllLaunchPads();

    var responseJson = _returnResponse(response);

    List<Launchpad> launchPads = parseLaunchpads(responseJson);

    return launchPads;
  }
}
