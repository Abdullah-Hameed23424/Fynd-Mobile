import 'dart:developer';

import 'package:fynd/core/config/app_config.dart';
import 'package:fynd/core/local_storage/flutter_secure_storage/app_storage.dart';
import 'package:fynd/core/local_storage/shared_preferences/app_shared_preferences.dart';

import 'package:dio/dio.dart';
import 'package:fynd/core/network/api_endpoints.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

/// [NetworkClient]
/// Is a singleton class that provides methods for making http requests using dio package or
/// Network client for handling HTTP requests
/// Provides a centralized way to manage API communications
class NetworkClient {
  static late Dio dio;
  static Future<bool>? _refreshFuture;

  static Future<bool> _refreshTokenOnce() {
    if (_refreshFuture != null) {
      return _refreshFuture!;
    }

    _refreshFuture = refreshAccessToken();

    _refreshFuture!.whenComplete(() {
      _refreshFuture = null;
    });

    return _refreshFuture!;
  }

  /// Initialize the network client
  /// Should be called once at app startup
  static Future<void> init() async {
    dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.baseUrl,
        headers: {
          'Accept': 'application/json',
          'Accept-Charset': 'application/json',
          'locale': AppSharedPreferences.getLocale,
        },
        connectTimeout: const Duration(seconds: AppConfig.apiTimeout),
        receiveTimeout: const Duration(seconds: AppConfig.apiTimeout),
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await AppStorage.getAccessToken;

          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }

          handler.next(options);
        },

        onError: (error, handler) async {
          if (error.response?.statusCode != 401) {
            handler.next(error);
            return;
          }

          final request = error.requestOptions;

          // Prevent infinite retry loop
          if (request.extra['retried'] == true) {
            handler.next(error);
            return;
          }

          request.extra['retried'] = true;

          final refreshed = await _refreshTokenOnce();

          if (!refreshed) {
            handler.next(error);
            return;
          }

          final newAccessToken = await AppStorage.getAccessToken;

          if (newAccessToken == null || newAccessToken.isEmpty) {
            handler.next(error);
            return;
          }

          request.headers['Authorization'] = 'Bearer $newAccessToken';

          try {
            final response = await dio.fetch(request);

            handler.resolve(response);
          } on DioException catch (e) {
            handler.next(e);
          }
        },
      ),
    );

    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: false,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        request: true,
        compact: true,
        maxWidth: 1000,
      ),
    );
  }

  static Future<bool> refreshAccessToken() async {
    log('Test Test');
    final refreshToken = await AppStorage.getRefreshToken;

    if (refreshToken == null || refreshToken.isEmpty) {
      return false;
    }

    final refreshDio = Dio(
      BaseOptions(
        baseUrl: AppConfig.baseUrl,
        headers: {
          'Accept': 'application/json',
          'Accept-Charset': 'application/json',
          'locale': AppSharedPreferences.getLocale,
        },
        connectTimeout: const Duration(seconds: AppConfig.apiTimeout),
        receiveTimeout: const Duration(seconds: AppConfig.apiTimeout),
      ),
    );

    try {
      final response = await refreshDio.post(
        ApiEndpoints.refreshToken,
        data: {'refreshToken': refreshToken},
      );

      final data = response.data;

      final newAccessToken = data['accessToken'];
      final newRefreshToken = data['refreshToken'];

      if (newAccessToken == null || newRefreshToken == null) {
        return false;
      }

      await AppStorage.saveAccessToken(newAccessToken);

      await AppStorage.saveRefreshToken(newRefreshToken);

      updateAuthToken(newAccessToken);

      return true;
    } on DioException {
      return false;
    }
  }

  /// Make a GET request
  static Future<Response> get({
    required String url,
    Map<String, dynamic> queryParameters = const {},
    Options? options,
  }) async {
    return await dio.get(
      url,
      queryParameters: queryParameters,
      options: options,
    );
  }

  /// Make a POST request
  static Future<Response> post({
    required String url,
    dynamic data,
    Map<String, dynamic> queryParameters = const {},
    Options? options,
    void Function(int, int)? onSendProgress,
  }) async {
    return await dio.post(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options,
      onSendProgress: onSendProgress,
    );
  }

  /// Make a PUT request
  static Future<Response> put({
    required String url,
    dynamic data,
    Map<String, dynamic> queryParameters = const {},
    Options? options,
  }) async {
    return await dio.put(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  /// Make a PATCH request
  static Future<Response> patch({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic> queryParameters = const {},
    Options? options,
  }) async {
    return await dio.patch(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  /// Make a DELETE request
  static Future<Response> delete({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic> queryParameters = const {},
    Options? options,
  }) async {
    return await dio.delete(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  /// Update authorization header
  static void updateAuthToken(String token) {
    dio.options.headers['Authorization'] = 'Bearer $token';
  }

  /// Clear authorization header
  static void clearAuthToken() {
    dio.options.headers.remove('Authorization');
  }
}
