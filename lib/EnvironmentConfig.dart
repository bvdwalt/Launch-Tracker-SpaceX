class EnvironmentConfig {
  static const SENTRY_DSN = String.fromEnvironment('SENTRY_DSN');
  static const Ad_Mob_App_ID = String.fromEnvironment('Ad_Mob_App_ID');
  static const Ad_Mob_Banner_ID = String.fromEnvironment('Ad_Mob_Banner_ID');
  static const BASE_URL = String.fromEnvironment('BASE_URL',
      defaultValue: 'https://api.spacexdata.com/v3');
}
