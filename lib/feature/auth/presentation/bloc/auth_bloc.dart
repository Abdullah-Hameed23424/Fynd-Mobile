import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fynd/core/errors/error_handler/exception_handler.dart';
import 'package:fynd/feature/auth/domain/usecases/forget_password_use_case.dart';
import 'package:fynd/feature/auth/domain/usecases/login_use_case.dart';
import 'package:fynd/feature/auth/domain/usecases/register_use_case.dart';
import 'package:fynd/feature/auth/domain/usecases/reset_password_use_case.dart';
import 'package:fynd/feature/auth/domain/usecases/verify_otp_use_case.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final ForgetPasswordUseCase forgetPasswordUseCase;
  final VerifyOtpUseCase verifyOtpUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;

  AuthBloc({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.forgetPasswordUseCase,
    required this.verifyOtpUseCase,
    required this.resetPasswordUseCase,
  }) : super(AuthInitial()) {
    on<LoginEvent>(_onLogin);
    on<RegisterEvent>(_onRegister);
    on<ForgetPasswordEvent>(_onForgetPassword);
    on<VerifyOtpEvent>(_onVerifyOtp);
    on<ResetPasswordEvent>(_onResetPassword);
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

  Future<void> _onForgetPassword(
    ForgetPasswordEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(ForgetPasswordLoading());

    try {
      await forgetPasswordUseCase(email: event.email);

      emit(ForgetPasswordSuccess());
    } catch (e, s) {
      logApiName('_onForgetPassword');
      emit(ForgetPasswordError(msg: handleError(e, stackTrace: s)));
    }
  }

  Future<void> _onVerifyOtp(
    VerifyOtpEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(VerifyOtpLoading());

    try {
      final String resetToken = await verifyOtpUseCase(
        email: event.email,
        otp: event.otp,
      );

      emit(VerifyOtpSuccess(resetToken: resetToken));
    } catch (e, s) {
      logApiName('_onVerifyOtp');
      emit(VerifyOtpError(msg: handleError(e, stackTrace: s)));
    }
  }

  Future<void> _onResetPassword(
    ResetPasswordEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(ResetPasswordLoading());

    try {
      await resetPasswordUseCase(
        resetToken: event.resetToken,
        password: event.password,
        confirmPassword: event.confirmPassword,
      );

      emit(ResetPasswordSuccess());
    } catch (e, s) {
      logApiName('_onResetPassword');
      emit(ResetPasswordError(msg: handleError(e, stackTrace: s)));
    }
  }
}
