import 'package:fynd/feature/profile/domain/repositories/profile_repository.dart';

class EditProfileUseCase {
  final ProfileRepository repository;

  EditProfileUseCase(this.repository);

  Future<bool> call({required Map<String, dynamic> data}) {
    return repository.editProfile(data: data);
  }
}
