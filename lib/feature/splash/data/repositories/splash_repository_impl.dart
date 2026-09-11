import 'package:fynd/feature/splash/data/datasources/splash_local_datasource.dart';
import 'package:fynd/feature/splash/data/datasources/splash_remote_datasource.dart';
import 'package:fynd/feature/splash/domain/repositories/splash_repository.dart';

/// Repository Implementation for splash

class SplashRepositoryImpl implements SplashRepository {
  final SplashRemoteDatasource remoteDatasource;
  final SplashLocalDatasource localDatasource;

  SplashRepositoryImpl({
    required this.remoteDatasource,
    required this.localDatasource,
  });

  // Add your method implementations here
}
