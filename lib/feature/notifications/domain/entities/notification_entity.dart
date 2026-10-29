class NotificationEntity {
  final int id;
  final String title;
  final String message;
  final String type;
  final dynamic relatedItemId;
  final dynamic relatedItemType;
  bool isRead;
  final DateTime? createdAt;
  final dynamic readAt;

  NotificationEntity({
    required this.id,
    required this.title,
    required this.message,
    required this.type,
    required this.relatedItemId,
    required this.relatedItemType,
    required this.isRead,
    required this.createdAt,
    required this.readAt,
  });
}
