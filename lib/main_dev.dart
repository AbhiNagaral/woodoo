import 'app/app_config.dart';
import 'app/app_initializer.dart';
import 'core/constants/environment.dart';

void main() async {

  AppConfig.initialize(
    environment: Environment.dev,
    baseUrl: 'https://api.dev.woodoo.com',
    enableLogs: true,
    appName: 'Woodoo Dev',
  );

  AppInitializer.run();
}
