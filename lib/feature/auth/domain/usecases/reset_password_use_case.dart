import 'package:fynd/feature/auth/domain/repositories/auth_repository.dart';

class ResetPasswordUseCase {
  final AuthRepository repository;
  ResetPasswordUseCase(this.repository);

  Future<void> call({
    required String resetToken,
    required String password,
    required String confirmPassword,
  }) async {
    return await repository.resetPassword(
      resetToken: resetToken,
      password: password,
      confirmPassword: confirmPassword,
    );
  }
}
