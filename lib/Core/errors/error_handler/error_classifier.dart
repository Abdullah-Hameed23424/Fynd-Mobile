import 'package:dio/dio.dart';
import 'package:fynd/core/errors/error_handler/app_error_type.dart';

class ErrorClassifier {
  static AppErrorType classify(Object error) {
    if (error is! DioException) {
      return AppErrorType.unknown;
    }

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return AppErrorType.connectionTimeout;
      case DioExceptionType.sendTimeout:
        return AppErrorType.sendTimeout;
      case DioExceptionType.receiveTimeout:
        return AppErrorType.receiveTimeout;
      case DioExceptionType.cancel:
        return AppErrorType.cancelled;
      case DioExceptionType.badCertificate:
        return AppErrorType.certificate;
      case DioExceptionType.connectionError:
        return AppErrorType.connection;
      case DioExceptionType.unknown:
        return AppErrorType.internet;
      case DioExceptionType.badResponse:
        return _mapStatusCode(error);
      case DioExceptionType.transformTimeout:
        return AppErrorType.unknown;
    }
  }

  static AppErrorType _mapStatusCode(DioException error) {
    final code = error.response?.statusCode;

    switch (code) {
      case 400:
        return AppErrorType.badRequest;
      case 401:
        return AppErrorType.unauthorized;
      case 403:
        return AppErrorType.forbidden;
      case 404:
        return AppErrorType.notFound;
      case 422:
        return AppErrorType.validation;
      case 500:
        return AppErrorType.serverError;
      case 503:
        return AppErrorType.serverDown;
      default:
        return AppErrorType.unknown;
    }
  }
}
