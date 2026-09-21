import 'package:dio/dio.dart';
import 'package:fynd/core/network/api_endpoints.dart';
import 'package:fynd/core/network/network_client.dart';

abstract class HomeRemoteDataSource {
  Future<Response> getHomeInfo();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  @override
  Future<Response> getHomeInfo() {
    return NetworkClient.get(url: ApiEndpoints.home);
  }
}
