import 'package:dio/dio.dart';
import 'package:fynd/core/network/api_endpoints.dart';
import 'package:fynd/core/network/network_client.dart';

abstract class ProfileRemoteDataSource {
  Future<Response> getProfile();
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  @override
  Future<Response> getProfile() {
    return NetworkClient.get(url: ApiEndpoints.getProfile);
  }
}
