import 'package:fynd/feature/auth/data/datasources/auth_local_datasource.dart';
import 'package:fynd/feature/auth/data/datasources/auth_remote_datasource.dart';
import 'package:fynd/feature/auth/domain/repositories/auth_repository.dart';

/// Repository Implementation for auth

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource remoteDatasource;
  final AuthLocalDatasource localDatasource;

  AuthRepositoryImpl({
    required this.remoteDatasource,
    required this.localDatasource,
  });

  // Add your method implementations here
}
