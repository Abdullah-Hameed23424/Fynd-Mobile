import 'package:fynd/core/config/app_config.dart';
import 'package:fynd/core/local_storage/flutter_secure_storage/app_storage.dart';
import 'package:fynd/core/local_storage/shared_preferences/app_shared_preferences.dart';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

/// [NetworkClient]
/// Is a singleton class that provides methods for making http requests using dio package or
/// Network client for handling HTTP requests
/// Provides a centralized way to manage API communications
class NetworkClient {
  static late Dio dio;
  static late String? _token;

  /// Initialize the network client
  /// Should be called once at app startup
  static Future<void> init() async {
    _token = await AppStorage.getToken;
    dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.baseUrl,
        headers: {
          if (_token != null && _token!.isNotEmpty)
            'Authorization': 'Bearer $_token',
          // 'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Accept-Charset': 'application/json',
          'locale': AppSharedPreferences.getLocale,
        },
        connectTimeout: const Duration(seconds: AppConfig.apiTimeout),
        receiveTimeout: const Duration(seconds: AppConfig.apiTimeout),
      ),
    );

    // Add logging interceptor for debugging
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
