import 'package:fynd/core/utils/model_parser.dart';
import 'package:fynd/feature/notifications/domain/entities/notification_entity.dart';

class NotificationsModel extends NotificationEntity {
  NotificationsModel({
    required super.id,
    required super.title,
    required super.message,
    required super.type,
    required super.relatedItemId,
    required super.relatedItemType,
    required super.isRead,
    required super.createdAt,
    required super.readAt,
  });

  factory NotificationsModel.fromMap(Map<String, dynamic> json) =>
      NotificationsModel(
        id: ModelParser.intValue(json['id']),
        title: ModelParser.stringValue(json['title']),
        message: ModelParser.stringValue(json['message']),
        type: ModelParser.stringValue(json['type']),
        relatedItemId: ModelParser.intValue(json['relatedItemId']),
        relatedItemType: ModelParser.stringValue(json['relatedItemType']),
        isRead: ModelParser.boolValue(json['isRead']),
        createdAt: ModelParser.dateTimeValue(json['createdAt']),
        readAt: ModelParser.dateTimeValue(json['readAt']),
      );
}
