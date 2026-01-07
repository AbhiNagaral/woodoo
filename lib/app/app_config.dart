import '../core/constants/environment.dart';

class AppConfig {
  final Environment environment;
  final String appName;
  final String baseUrl;
  final bool enableLogs;

  static AppConfig? _instance;

  AppConfig._({
    required this.environment,
    required this.appName,
    required this.baseUrl,
    required this.enableLogs,
  });

  /// Must be called exactly once before runApp()
  static void initialize({
    required Environment environment,
    required String appName,
    required String baseUrl,
    required bool enableLogs,
  }) {
    if (_instance != null) {
      throw StateError('AppConfig already initialized');
    }

    _instance = AppConfig._(
      environment: environment,
      appName: appName,
      baseUrl: baseUrl,
      enableLogs: enableLogs,
    );
  }

  /// Safe global access
  static AppConfig get instance {
    final config = _instance;
    if (config == null) {
      throw StateError('AppConfig not initialized');
    }
    return config;
  }

  bool get isDev => environment == Environment.dev;
  bool get isUat => environment == Environment.uat;
  bool get isProd => environment == Environment.prod;
}
