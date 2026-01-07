import 'app/app_config.dart';
import 'app/app_initializer.dart';
import 'core/constants/environment.dart';

void main() async {

  AppConfig.initialize(
    environment: Environment.uat,
    baseUrl: 'https://api.uat.woodoo.com',
    enableLogs: true,
    appName: 'Woodoo UAT',
  );

  AppInitializer.run();
}
