import 'package:dio/dio.dart';

class LoggingInterceptor extends LogInterceptor {
  LoggingInterceptor()
      : super(
    requestBody: true,
    responseBody: true,
  );
}
