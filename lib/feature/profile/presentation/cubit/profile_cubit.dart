import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fynd/core/errors/error_handler/exception_handler.dart';
import 'package:fynd/feature/profile/domain/entities/profile_entity.dart';
import 'package:fynd/feature/profile/domain/usecases/edit_profile_use_case.dart';
import 'package:fynd/feature/profile/domain/usecases/get_profile_usecase.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileUseCase getProfileUseCase;
  final EditProfileUseCase editProfileUseCase;
  ProfileCubit({
    required this.getProfileUseCase,
    required this.editProfileUseCase,
  }) : super(ProfileInitial());

  late ProfileEntity profileEntity;
  bool profileDataLoaded = false;

  Future<void> getProfile() async {
    emit(ProfileLoading());

    try {
      profileEntity = await getProfileUseCase();

      if (isClosed) return;
      profileDataLoaded = true;
      emit(ProfileLoaded());
    } catch (e, s) {
      if (isClosed) return;
      logApiName('getProfile');
      emit(ProfileError(msg: handleError(e, stackTrace: s)));
    }
  }

  Future<void> editProfile({required Map<String, dynamic> data}) async {
    emit(EditProfileSuccess());

    try {
      await editProfileUseCase(data: data);

      if (isClosed) return;
      emit(EditProfileSuccess());
    } catch (e, s) {
      if (isClosed) return;
      logApiName('editProfile');
      emit(EditProfileError(msg: handleError(e, stackTrace: s)));
    }
  }
}
