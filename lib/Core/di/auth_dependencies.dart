import 'package:fynd/feature/auth/data/datasources/auth_remote_datasource.dart';
import 'package:fynd/feature/auth/data/repositories/auth_repository_impl.dart';
import 'package:fynd/feature/auth/domain/usecases/forget_password_use_case.dart';
import 'package:fynd/feature/auth/domain/usecases/login_use_case.dart';
import 'package:fynd/feature/auth/domain/usecases/register_use_case.dart';
import 'package:fynd/feature/auth/domain/usecases/reset_password_use_case.dart';
import 'package:fynd/feature/auth/domain/usecases/verify_otp_use_case.dart';
import 'package:fynd/feature/auth/presentation/bloc/auth_bloc.dart';

AuthBloc createAuthBloc() {
  final remoteDataSource = AuthRemoteDataSourceImpl();
  final repository = AuthRepositoryImpl(remoteDataSource);

  final loginUseCase = LoginUseCase(repository);
  final registerUseCase = RegisterUseCase(repository);
  final forgetPasswordUseCase = ForgetPasswordUseCase(repository);
  final verifyOtpUseCase = VerifyOtpUseCase(repository);
  final resetPasswordUseCase = ResetPasswordUseCase(repository);

  return AuthBloc(
    loginUseCase: loginUseCase,
    registerUseCase: registerUseCase,
    forgetPasswordUseCase: forgetPasswordUseCase,
    verifyOtpUseCase: verifyOtpUseCase,
    resetPasswordUseCase: resetPasswordUseCase,
  );
}
