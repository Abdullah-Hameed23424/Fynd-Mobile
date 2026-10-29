import 'package:fynd/feature/profile/data/datasources/profile_remote_data_source.dart';
import 'package:fynd/feature/profile/data/repositories/profile_repository_impl.dart';
import 'package:fynd/feature/profile/domain/usecases/edit_profile_use_case.dart';
import 'package:fynd/feature/profile/domain/usecases/get_profile_usecase.dart';
import 'package:fynd/feature/profile/presentation/cubit/profile_cubit.dart';

ProfileCubit createProfileCubit() {
  final remoteDataSource = ProfileRemoteDataSourceImpl();
  final repository = ProfileRepositoryImpl(remoteDataSource: remoteDataSource);

  final getProfileUseCase = GetProfileUseCase(repository);
  final editProfileUseCase = EditProfileUseCase(repository);

  return ProfileCubit(
    getProfileUseCase: getProfileUseCase,
    editProfileUseCase: editProfileUseCase,
  );
}
