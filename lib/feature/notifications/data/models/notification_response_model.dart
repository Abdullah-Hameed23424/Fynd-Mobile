import 'package:fynd/core/utils/model_parser.dart';
import 'package:fynd/feature/notifications/data/models/notification_model.dart';
import 'package:fynd/feature/notifications/domain/entities/notification_response_entity.dart';

class NotificationResponseModel extends NotificationResponseEntity {
  NotificationResponseModel({
    required super.notifications,
    required super.page,
    required super.pageSize,
    required super.totalCount,
    required super.unreadCount,
    required super.totalPages,
  });

  factory NotificationResponseModel.fromMap(Map<String, dynamic> json) =>
      NotificationResponseModel(
        notifications: List<NotificationsModel>.from(
          json['notifications'].map((x) => NotificationsModel.fromMap(x)),
        ),
        page: ModelParser.intValue(json['page']),
        pageSize: ModelParser.intValue(json['pageSize']),
        totalCount: ModelParser.intValue(json['totalCount']),
        unreadCount: ModelParser.intValue(json['unreadCount']),
        totalPages: ModelParser.intValue(json['totalPages']),
      );
}
