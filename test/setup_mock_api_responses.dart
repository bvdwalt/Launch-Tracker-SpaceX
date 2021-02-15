import 'dart:io';

import 'package:launch_tracker_spacex/service_locator.dart';
import 'package:mockito/mockito.dart';
import 'package:spacex_api/spacex_api.dart';
import 'data/TestLaunchPadObj.dart';
import 'data/TestLaunchesObj.dart';
import 'data/TestPayloadObj.dart';
import 'data/TestRocketObj.dart';
import 'package:http/http.dart' as http;

class SetupMockAPIResponses {
  static MockDataAPIResponses() {
    final client = getIt.get<SpaceXApi>();

    when(client.getAllLaunches()).thenAnswer((_) async {
      return http.Response(TestLaunchesObj.launchesJson, 200);
    });

    when(client.getAllPayloads()).thenAnswer((_) async {
      return http.Response(TestPayloadObj.payloadJson, 200);
    });

    when(client.getAllRockets()).thenAnswer((_) async {
      return http.Response(TestRocketObj.rocketJson, 200);
    });

    when(client.getAllLaunchPads()).thenAnswer((_) async {
      return http.Response(TestLaunchPadObj.launchPadJson, 200);
    });
  }

  static MockErrorAPIResponses() {
    final client = getIt.get<SpaceXApi>();

    when(client.getAllLaunches())
        .thenAnswer((_) async => throw SocketException("Failed host lookup:"));

    when(client.getAllPayloads())
        .thenAnswer((_) async => throw SocketException("Failed host lookup:"));

    when(client.getAllRockets())
        .thenAnswer((_) async => throw SocketException("Failed host lookup:"));

    when(client.getAllLaunchPads())
        .thenAnswer((_) async => throw SocketException("Failed host lookup:"));
  }
}
