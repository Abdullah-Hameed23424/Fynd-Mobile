part of 'notifications_cubit.dart';

sealed class NotificationsState extends Equatable {
  const NotificationsState();

  @override
  List<Object> get props => [];
}

final class NotificationsInitial extends NotificationsState {}

final class NotificationsLoading extends NotificationsState {}

final class NotificationsLoaded extends NotificationsState {}

final class NotificationsError extends NotificationsState {
  final String msg;
  const NotificationsError({required this.msg});

  @override
  List<Object> get props => [msg];
}

final class ReadAllLoading extends NotificationsState {}

final class ReadAllSuccess extends NotificationsState {}

final class ReadAllError extends NotificationsState {
  final String msg;
  const ReadAllError({required this.msg});

  @override
  List<Object> get props => [msg];
}

final class ReadOneLoading extends NotificationsState {}

final class ReadOneSuccess extends NotificationsState {}

final class ReadOneError extends NotificationsState {
  final String msg;
  const ReadOneError({required this.msg});

  @override
  List<Object> get props => [msg];
}

final class UnreadCountLoading extends NotificationsState {}

final class UnreadCountSuccess extends NotificationsState {
  final int unreadCount;
  const UnreadCountSuccess({required this.unreadCount});

  @override
  List<Object> get props => [unreadCount];
}

final class UnreadCountError extends NotificationsState {
  final String msg;
  const UnreadCountError({required this.msg});

  @override
  List<Object> get props => [msg];
}
