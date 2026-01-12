import 'package:dio/dio.dart';

sealed class NetworkException implements Exception {
  const NetworkException();

  factory NetworkException.fromDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const TimeoutException();
      case DioExceptionType.badResponse:
        return ApiException(
          error.response?.statusCode,
          error.response?.data,
        );
      case DioExceptionType.connectionError:
        return const NoInternetException();
      default:
        return const UnknownNetworkException();
    }
  }
}

class TimeoutException extends NetworkException {
  const TimeoutException();
}

class NoInternetException extends NetworkException {
  const NoInternetException();
}

class ApiException extends NetworkException {
  final int? statusCode;
  final dynamic body;

  const ApiException(this.statusCode, this.body);
}

class UnknownNetworkException extends NetworkException {
  const UnknownNetworkException();
}
