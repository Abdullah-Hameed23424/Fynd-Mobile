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
}
