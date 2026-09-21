part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final HomeEntity homeEntity;
  const HomeLoaded({required this.homeEntity});

  @override
  List<Object> get props => [homeEntity];
}

final class HomeError extends HomeState {
  final String msg;
  const HomeError({required this.msg});

  @override
  List<Object> get props => [msg];
}
