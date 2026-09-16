import 'package:fynd/core/local_storage/flutter_secure_storage/app_storage.dart';
import 'package:fynd/feature/auth/data/datasources/auth_remote_datasource.dart';
import 'package:fynd/feature/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<void> login({required String email, required String password}) async {
    final response = await remoteDataSource.login(
      email: email,
      password: password,
    );

    final data = response.data;
    await AppStorage.saveToken(data['token']);
    await AppStorage.saveMyId(data['id']);
  }

  @override
  Future<void> register({
    required String fullname,
    required String email,
    required String password,
  }) async {
    final response = await remoteDataSource.register(
      fullname: fullname,
      email: email,
      password: password,
    );

    final data = response.data;
    await AppStorage.saveToken(data['token']);
    await AppStorage.saveMyId(data['id']);
  }

  @override
  Future<void> forgetPassword({required String email}) async {
    await remoteDataSource.forgetPassword(email: email);
  }

  @override
  Future<String> verifyOtp({required String email, required String otp}) async {
    final response = await remoteDataSource.verifyOtp(email: email, otp: otp);

    return response.data['resetToken'];
  }

  @override
  Future<void> resetPassword({
    required String resetToken,
    required String password,
    required String confirmPassword,
  }) async {
    await remoteDataSource.resetPassword(
      resetToken: resetToken,
      password: password,
      confirmPassword: confirmPassword,
    );
  }
}
