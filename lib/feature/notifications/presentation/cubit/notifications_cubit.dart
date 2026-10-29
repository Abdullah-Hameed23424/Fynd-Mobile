import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fynd/core/errors/error_handler/exception_handler.dart';
import 'package:fynd/feature/notifications/domain/entities/notification_response_entity.dart';
import 'package:fynd/feature/notifications/domain/usecases/get_all_notifications_use_case.dart';
import 'package:fynd/feature/notifications/domain/usecases/get_unread_count_use_case.dart';
import 'package:fynd/feature/notifications/domain/usecases/mark_all_as_read_use_case.dart';
import 'package:fynd/feature/notifications/domain/usecases/mark_as_read_use_case.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  final GetAllNotificationsUseCase getAllNotificationsUseCase;
  final MarkAllAsReadUseCase markAllAsReadUseCase;
  final MarkAsReadUseCase markAsReadUseCase;
  final GetUnreadCountUseCase getUnreadCountUseCase;
  NotificationsCubit({
    required this.getAllNotificationsUseCase,
    required this.markAllAsReadUseCase,
    required this.markAsReadUseCase,
    required this.getUnreadCountUseCase,
  }) : super(NotificationsInitial());

  late final NotificationResponseEntity notificationResponseEntity;
  bool dataLoaded = false;

  Future<void> getAllNotifications() async {
    emit(NotificationsLoading());

    try {
      notificationResponseEntity = await getAllNotificationsUseCase();
      dataLoaded = true;

      if (isClosed) return;
      emit(NotificationsLoaded());
    } catch (e, s) {
      if (isClosed) return;
      logApiName('getAllNotifications');
      emit(NotificationsError(msg: handleError(e, stackTrace: s)));
    }
  }

  Future<void> markAllAsRead() async {
    emit(ReadAllLoading());

    try {
      await markAllAsReadUseCase();

      if (isClosed) return;
      emit(ReadAllSuccess());
    } catch (e, s) {
      if (isClosed) return;
      logApiName('markAllAsRead');
      emit(ReadAllError(msg: handleError(e, stackTrace: s)));
    }
  }

  Future<void> markAsRead({required int id}) async {
    emit(ReadOneLoading());

    try {
      await markAsReadUseCase(id: id);
      notificationResponseEntity.notifications.map((item) {
        if (item.id == id) {
          item.isRead = true;
        }
      });

      if (isClosed) return;
      emit(ReadOneSuccess());
    } catch (e, s) {
      if (isClosed) return;
      logApiName('markAsRead');
      emit(ReadOneError(msg: handleError(e, stackTrace: s)));
    }
  }

  Future<void> getUnreadCount() async {
    emit(UnreadCountLoading());

    try {
      final int unreadCount = await getUnreadCountUseCase();

      if (isClosed) return;
      emit(UnreadCountSuccess(unreadCount: unreadCount));
    } catch (e, s) {
      if (isClosed) return;
      logApiName('getUnreadCount');
      emit(UnreadCountError(msg: handleError(e, stackTrace: s)));
    }
  }
}
