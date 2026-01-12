import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:woodoo/app/app_config.dart';

import '../constants/environment.dart';
import '../network/dio_client.dart';
import '../network/interceptors/auth_interceptor.dart';
import '../network/interceptors/error_interceptor.dart';
import '../network/interceptors/logging_interceptor.dart';
import '../storage/app_preferences.dart';
import 'storage_providers.dart';

final dioProvider = Provider<Dio>((ref) {
  final config = AppConfig.instance;
  final env = config.environment;

  return DioClient(
    baseUrl: config.baseUrl,
    interceptors: [
      /// Auth header injection
      AuthInterceptor(() async {
        return ref
            .read(appPreferencesProvider)
            .get<String>(PrefKeys.accessToken);
      }),

      /// Normalize Dio errors
      ErrorInterceptor(),

      /// Logging only in non-prod
      if (env != Environment.prod) LoggingInterceptor(),
    ],
  ).dio;
});
