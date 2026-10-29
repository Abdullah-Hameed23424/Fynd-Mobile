part of 'profile_cubit.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileLoaded extends ProfileState {}

final class ProfileError extends ProfileState {
  final String msg;
  const ProfileError({required this.msg});

  @override
  List<Object> get props => [msg];
}

final class EditProfileLoading extends ProfileState {}

final class EditProfileSuccess extends ProfileState {}

final class EditProfileError extends ProfileState {
  final String msg;
  const EditProfileError({required this.msg});

  @override
  List<Object> get props => [msg];
}
