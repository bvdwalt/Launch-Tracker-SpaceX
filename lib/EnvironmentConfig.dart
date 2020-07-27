class EnvironmentConfig {
  static const SENTRY_DSN =
      String.fromEnvironment('SENTRY_DSN', defaultValue: 'https://...');

  static const Ad_Mob_App_ID = String.fromEnvironment('Ad_Mob_App_ID',
      defaultValue: 'ca-app-pub-7724266756224086~6556146475');

  static const Ad_Mob_Banner_ID = String.fromEnvironment('Ad_Mob_Banner_ID',
      defaultValue: 'ca-app-pub-7724266756224086/4427201800');

  static const BASE_URL = String.fromEnvironment('BASE_URL',
      defaultValue: 'https://api.spacexdata.com/v3');
}
