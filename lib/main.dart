import 'package:sentry/sentry.dart';
import 'package:spacex_flights/service_locator.dart';
import 'package:spacex_flights/src/spacex_flights.dart';
import 'package:catcher/catcher.dart';

void main() {
  registerServices();

  CatcherOptions debugOptions = CatcherOptions(
      DialogReportMode(), [SentryHandler(getIt.get<SentryClient>())]);

  CatcherOptions releaseOptions = CatcherOptions(
      SilentReportMode(), [SentryHandler(getIt.get<SentryClient>())]);

  Catcher(SpaceXFlights(),
      debugConfig: debugOptions, releaseConfig: releaseOptions);
}
