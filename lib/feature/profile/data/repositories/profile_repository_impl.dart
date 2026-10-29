import 'package:dio/dio.dart';
import 'package:fynd/feature/profile/data/models/profile_model.dart';
import 'package:fynd/feature/profile/domain/entities/profile_entity.dart';
import 'package:fynd/feature/profile/domain/repositories/profile_repository.dart';
import 'package:fynd/feature/profile/data/datasources/profile_remote_data_source.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepositoryImpl({required this.remoteDataSource});

  @override
  Future<ProfileEntity> getProfile() async {
    final Response response = await remoteDataSource.getProfile();

    return ProfileModel.fromMap(response.data);
  }

  @override
  Future<bool> editProfile({required Map<String, dynamic> data}) async {
    final Response response = await remoteDataSource.editProfile(data: data);

    if (response.statusCode == 204) {
      return true;
    } else {
      return false;
    }
  }
}
