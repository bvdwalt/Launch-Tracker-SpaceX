class EnvironmentConfig {
  static const SENTRY_DSN = String.fromEnvironment(
    'SENTRY_DSN'
  );
  static const BASE_URL = String.fromEnvironment(
      'BASE_URL',
      defaultValue: 'https://api.spacexdata.com/v3'
  );
}