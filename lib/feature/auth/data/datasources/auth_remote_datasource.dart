import 'package:fynd/core/network/api_endpoints.dart';
import 'package:fynd/core/network/network_client.dart';

import 'package:dio/dio.dart';

abstract class AuthRemoteDataSource {
  Future<Response> login({required String email, required String password});

  Future<Response> register({
    required String fullname,
    required String email,
    required String password,
  });

  Future<Response> forgetPassword({required String email});

  Future<Response> verifyOtp({required String email, required String otp});

  Future<Response> resetPassword({
    required String resetToken,
    required String password,
    required String confirmPassword,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<Response> login({required String email, required String password}) {
    return NetworkClient.post(
      url: ApiEndpoints.login,
      data: {'email': email, 'password': password},
    );
  }

  @override
  Future<Response> register({
    required String fullname,
    required String email,
    required String password,
  }) {
    return NetworkClient.post(
      url: ApiEndpoints.register,
      data: {'fullName': fullname, 'email': email, 'password': password},
    );
  }

  @override
  Future<Response<dynamic>> forgetPassword({required String email}) {
    return NetworkClient.post(
      url: ApiEndpoints.forgetPassword,
      data: {'email': email},
    );
  }

  @override
  Future<Response<dynamic>> verifyOtp({
    required String email,
    required String otp,
  }) {
    return NetworkClient.post(
      url: ApiEndpoints.otp,
      data: {'email': email, 'otp': otp},
    );
  }

  @override
  Future<Response<dynamic>> resetPassword({
    required String resetToken,
    required String password,
    required String confirmPassword,
  }) {
    return NetworkClient.post(
      url: ApiEndpoints.resetPassword,
      data: {
        'resetToken': resetToken,
        'newPassword': password,
        'confirmPassword': confirmPassword,
      },
    );
  }
}
