import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fynd/feature/splash/domain/usecases/check_auth_status_use_case.dart';
import 'package:fynd/feature/splash/domain/usecases/first_time_use_use_case.dart';
import 'package:fynd/feature/splash/presentation/cubits/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final FirstTimeUseUseCase firstTimeUseUseCase;
  final CheckAuthStatusUseCase checkAuthStatus;

  SplashCubit(this.firstTimeUseUseCase, this.checkAuthStatus)
    : super(SplashInitial());

  Future<void> checkUserStatus() async {
    try {
      emit(SplashLoading());

      await Future.delayed(const Duration(seconds: 3));
      final bool isFirstTime = await firstTimeUseUseCase.call();
      final bool isAuthenticated = await checkAuthStatus.call();

      if (isFirstTime) {
        emit(SplashFirstTime());
      } else if (isAuthenticated) {
        emit(SplashAuthenticated());
      } else {
        emit(SplashUnauthenticated());
      }
    } catch (e) {
      emit(SplashError(message: e.toString()));
    }
  }
}
