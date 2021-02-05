import 'package:launch_tracker_spacex/service_locator.dart';
import 'package:launch_tracker_spacex/src/spacex_flights.dart';
import 'package:sentry/sentry.dart';
import 'package:catcher/catcher.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  registerServices();

  CatcherOptions debugOptions =
      CatcherOptions(SilentReportMode(), [ConsoleHandler()]);

  CatcherOptions releaseOptions = CatcherOptions(
      SilentReportMode(), [SentryHandler(getIt.get<SentryClient>())]);

  Catcher(SpaceXFlights(),
      debugConfig: debugOptions, releaseConfig: releaseOptions);
}
