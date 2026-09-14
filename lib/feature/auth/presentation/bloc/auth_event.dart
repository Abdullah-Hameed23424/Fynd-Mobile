part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class LoginEvent extends AuthEvent {
  final String email;
  final String password;
  const LoginEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

final class RegisterEvent extends AuthEvent {
  final String fullname;
  final String email;
  final String password;
  const RegisterEvent({
    required this.fullname,
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}

final class ForgetPasswordEvent extends AuthEvent {
  final String email;
  const ForgetPasswordEvent({required this.email});

  @override
  List<Object> get props => [email];
}

final class VerifyOtpEvent extends AuthEvent {
  final String email;
  final String otp;
  const VerifyOtpEvent({required this.email, required this.otp});

  @override
  List<Object> get props => [email, otp];
}
