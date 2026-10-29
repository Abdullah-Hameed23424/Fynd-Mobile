import 'package:fynd/feature/profile/domain/entities/profile_entity.dart';

abstract class ProfileRepository {
  Future<ProfileEntity> getProfile();

  Future<bool> editProfile({required Map<String, dynamic> data});
}
