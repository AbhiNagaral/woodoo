import 'package:dio/dio.dart';

import '../network_exceptions.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    handler.next(
      err.copyWith(
        error: NetworkException.fromDioError(err),
      ),
    );
  }
}
