import 'package:fynd/feature/home/data/datasources/home_local_datasource.dart';
import 'package:fynd/feature/home/data/datasources/home_remote_datasource.dart';
import 'package:fynd/feature/home/domain/repositories/home_repository.dart';

/// Repository Implementation for home

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDatasource remoteDatasource;
  final HomeLocalDatasource localDatasource;

  HomeRepositoryImpl({
    required this.remoteDatasource,
    required this.localDatasource,
  });

  // Add your method implementations here
}
