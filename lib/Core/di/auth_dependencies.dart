import 'package:fynd/feature/auth/data/datasources/auth_remote_datasource.dart';
import 'package:fynd/feature/auth/data/repositories/auth_repository_impl.dart';
import 'package:fynd/feature/auth/domain/usecases/login_use_case.dart';
import 'package:fynd/feature/auth/domain/usecases/register_use_case.dart';
import 'package:fynd/feature/auth/presentation/bloc/auth_bloc.dart';

AuthBloc createAuthBloc() {
  final remoteDataSource = AuthRemoteDataSourceImpl();
  final repository = AuthRepositoryImpl(remoteDataSource);

  final loginUseCase = LoginUseCase(repository);
  final registerUseCase = RegisterUseCase(repository);

  return AuthBloc(loginUseCase, registerUseCase);
}
