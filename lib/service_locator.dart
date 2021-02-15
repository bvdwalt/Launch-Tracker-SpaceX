import 'package:get_it/get_it.dart';
import 'package:launch_tracker_spacex/EnvironmentConfig.dart';
import 'package:launch_tracker_spacex/src/blocs/flights_bloc.dart';
import 'package:launch_tracker_spacex/src/resources/flight_provider.dart';
import 'package:launch_tracker_spacex/src/resources/spacex_data_repository.dart';
import 'package:package_info/package_info.dart';
import 'package:spacex_api/spacex_api.dart';
import 'package:mockito/mockito.dart';
import 'package:sentry/sentry.dart';

final getIt = GetIt.instance;

void registerServices({bool testing = false}) {
  getIt.reset();

  getIt.registerLazySingleton(() => FlightProvider());
  getIt.registerLazySingleton(() => SpaceXDataBloc());
  getIt.registerLazySingleton(() => SpaceXDataRepository());

  getIt.registerLazySingleton(
      () => SentryClient(dsn: EnvironmentConfig.SENTRY_DSN));

  if (!testing) {
    getIt.registerSingletonAsync(() async => await PackageInfo.fromPlatform());
    getIt.registerLazySingleton<SpaceXApi>(() => SpaceXApi());
  } else {
    getIt.registerLazySingleton<SpaceXApi>(() => MockClient());
  }
}

class MockClient extends Mock implements SpaceXApi {}
