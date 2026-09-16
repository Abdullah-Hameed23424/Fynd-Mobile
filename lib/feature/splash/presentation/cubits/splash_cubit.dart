import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fynd/feature/splash/domain/usecases/check_auth_status_use_case.dart';
import 'package:fynd/feature/splash/presentation/cubits/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final CheckAuthStatusUseCase checkAuthStatus;

  SplashCubit(this.checkAuthStatus) : super(SplashInitial());

  Future<void> checkUserStatus() async {
    try {
      emit(SplashLoading());

      await Future.delayed(const Duration(seconds: 3));
      final isAuthenticated = await checkAuthStatus();

      if (isAuthenticated) {
        emit(SplashAuthenticated());
      } else {
        emit(SplashUnauthenticated());
      }
    } catch (e) {
      emit(SplashError(message: e.toString()));
    }
  }
}
