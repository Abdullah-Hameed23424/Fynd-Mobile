import 'package:dio/dio.dart';
import 'package:fynd/core/network/api_endpoints.dart';
import 'package:fynd/core/network/network_client.dart';

abstract class ProfileRemoteDataSource {
  Future<Response> getProfile();

  Future<Response> editProfile({required Map<String, dynamic> data});
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  @override
  Future<Response> getProfile() {
    return NetworkClient.get(url: ApiEndpoints.profile);
  }

  @override
  Future<Response> editProfile({required Map<String, dynamic> data}) {
    return NetworkClient.put(url: ApiEndpoints.profile, data: data);
  }
}
