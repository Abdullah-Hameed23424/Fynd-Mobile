import 'package:fynd/feature/notifications/domain/entities/notification_entity.dart';

class NotificationResponseEntity {
  final List<NotificationEntity> notifications;
  final int page;
  final int pageSize;
  final int totalCount;
  final int unreadCount;
  final int totalPages;

  NotificationResponseEntity({
    required this.notifications,
    required this.page,
    required this.pageSize,
    required this.totalCount,
    required this.unreadCount,
    required this.totalPages,
  });
}
