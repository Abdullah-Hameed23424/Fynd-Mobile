import 'package:fynd/feature/auth/domain/repositories/auth_repository.dart';

class ForgetPasswordUseCase {
  final AuthRepository repository;
  ForgetPasswordUseCase(this.repository);

  Future<void> call({required String email}) async {
    return await repository.forgetPassword(email: email);
  }
}
