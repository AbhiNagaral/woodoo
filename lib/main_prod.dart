import 'app/app_config.dart';
import 'app/app_initializer.dart';
import 'core/constants/environment.dart';

void main() async {

  AppConfig.initialize(
    environment: Environment.prod,
    baseUrl: 'https://api.woodoo.com',
    enableLogs: false,
    appName: 'Woodoo Prod',
  );

  AppInitializer.run();
}
