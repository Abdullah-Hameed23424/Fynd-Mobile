import 'package:fynd/feature/auth/domain/repositories/auth_repository.dart';

class GetAuthUseCase {
  final AuthRepository repository;

  GetAuthUseCase(this.repository);

  Future<void> call() async {}
}
