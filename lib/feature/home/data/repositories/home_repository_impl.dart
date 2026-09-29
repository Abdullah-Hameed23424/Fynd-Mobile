import 'package:fynd/feature/home/data/datasources/home_remote_data_source.dart';
import 'package:fynd/feature/home/data/models/home_response.dart';
import 'package:fynd/feature/home/domain/entities/home_entity.dart';
import 'package:fynd/feature/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<HomeEntity> getHomeInfo() async {
    final response = await remoteDataSource.getHomeInfo();

    return HomeResponse.fromMap(response.data);
  }
}
