import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fynd/core/errors/error_handler/exception_handler.dart';
import 'package:fynd/feature/auth/domain/usecases/login_use_case.dart';
import 'package:fynd/feature/auth/domain/usecases/register_use_case.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;

  AuthBloc(this.loginUseCase, this.registerUseCase) : super(AuthInitial()) {
    on<LoginEvent>(_onLogin);
    on<RegisterEvent>(_onRegister);
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(LoginLoading());

    try {
      await loginUseCase(email: event.email, password: event.password);

      emit(LoginSuccess());
    } catch (e, s) {
      logApiName('_onLogin');
      emit(LoginError(msg: handleError(e, stackTrace: s)));
    }
  }

  Future<void> _onRegister(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(RegisterLoading());

    try {
      await registerUseCase(
        fullname: event.fullname,
        email: event.email,
        password: event.password,
      );

      emit(RegisterSuccess());
    } catch (e, s) {
      logApiName('_onRegister');
      emit(RegisterError(msg: handleError(e, stackTrace: s)));
    }
  }
}
