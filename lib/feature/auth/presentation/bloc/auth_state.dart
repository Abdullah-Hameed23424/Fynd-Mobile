part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class LoginLoading extends AuthState {}

final class LoginSuccess extends AuthState {}

final class LoginError extends AuthState {
  final String msg;
  const LoginError({required this.msg});

  @override
  List<Object> get props => [msg];
}

final class RegisterLoading extends AuthState {}

final class RegisterSuccess extends AuthState {}

final class RegisterError extends AuthState {
  final String msg;
  const RegisterError({required this.msg});

  @override
  List<Object> get props => [msg];
}
