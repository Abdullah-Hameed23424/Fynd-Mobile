import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fynd/core/errors/error_handler/error_classifier.dart';
import 'package:fynd/core/errors/error_handler/error_localizer.dart';
import 'package:fynd/core/errors/error_handler/error_side_effects.dart';

class ErrorHandler {
  static String handle(Object error, {StackTrace? stackTrace}) {
    final trace = stackTrace ?? StackTrace.current;

    final type = ErrorClassifier.classify(error);

    ErrorSideEffects.handle(type, error, trace);

    if (error is DioException) {
      final responseData = error.response?.data;
      if (responseData is Map) {
        final message = responseData['message'];
        if (message is String && message.trim().isNotEmpty) {
          return message;
        }
        if (message != null) {
          return message.toString();
        }
      }
    }

    return ErrorLocalizer.message(type);
  }
}

String handleError(Object error, {StackTrace? stackTrace}) {
  return ErrorHandler.handle(error, stackTrace: stackTrace);
}

void logApiName(String apiName) {
  log('===============================================');
  log('=============== [ $apiName ] ===============');
  log('===============================================');
}
