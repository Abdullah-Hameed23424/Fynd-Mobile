import 'package:fynd/feature/auth/domain/repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository repository;
  RegisterUseCase(this.repository);

  Future<void> call({
    required String fullname,
    required String email,
    required String password,
  }) async {
    return await repository.register(
      fullname: fullname,
      email: email,
      password: password,
    );
  }
}
