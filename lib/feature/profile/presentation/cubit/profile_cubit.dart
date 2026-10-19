import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fynd/core/errors/error_handler/exception_handler.dart';
import 'package:fynd/feature/profile/domain/entities/profile_entity.dart';
import 'package:fynd/feature/profile/domain/usecases/get_profile_usecase.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileUseCase getProfileUseCase;
  ProfileCubit({required this.getProfileUseCase}) : super(ProfileInitial());

  Future<void> getProfile() async {
    emit(ProfileLoading());

    try {
      final ProfileEntity profileEntity = await getProfileUseCase();

      if (isClosed) return;
      emit(ProfileLoaded(profileEntity: profileEntity));
    } catch (e, s) {
      if (isClosed) return;
      logApiName('getProfile');
      emit(ProfileError(msg: handleError(e, stackTrace: s)));
    }
  }
}
