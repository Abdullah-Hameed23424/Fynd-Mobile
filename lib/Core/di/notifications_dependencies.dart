import 'package:fynd/feature/notifications/data/datasources/notifications_remote_data_source.dart';
import 'package:fynd/feature/notifications/data/repositories/notifications_repository_impl.dart';
import 'package:fynd/feature/notifications/domain/usecases/get_all_notifications_use_case.dart';
import 'package:fynd/feature/notifications/domain/usecases/get_unread_count_use_case.dart';
import 'package:fynd/feature/notifications/domain/usecases/mark_all_as_read_use_case.dart';
import 'package:fynd/feature/notifications/domain/usecases/mark_as_read_use_case.dart';
import 'package:fynd/feature/notifications/presentation/cubit/notifications_cubit.dart';

NotificationsCubit createNotificationsCubit() {
  final remoteDataSource = NotificationsRemoteDataSourceImpl();
  final repository = NotificationsRepositoryImpl(
    remoteDataSource: remoteDataSource,
  );

  final getAllNotificationsUseCase = GetAllNotificationsUseCase(repository);
  final markAllAsReadUseCase = MarkAllAsReadUseCase(repository);
  final markAsReadUseCase = MarkAsReadUseCase(repository);
  final getUnreadCountUseCase = GetUnreadCountUseCase(repository);

  return NotificationsCubit(
    getAllNotificationsUseCase: getAllNotificationsUseCase,
    markAllAsReadUseCase: markAllAsReadUseCase,
    markAsReadUseCase: markAsReadUseCase,
    getUnreadCountUseCase: getUnreadCountUseCase,
  );
}
