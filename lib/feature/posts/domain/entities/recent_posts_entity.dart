import 'package:fynd/core/enums/app_enums.dart';

class RecentPostEntity {
  final int id;
  final String title;
  final String description;
  final String location;
  final String date;
  final PostType type;
  final DateTime? createdAt;
  final int userId;
  final int categoryId;
  final String categoryName;
  final String? imageUrl;

  RecentPostEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.date,
    required this.type,
    required this.createdAt,
    required this.userId,
    required this.categoryId,
    required this.categoryName,
    required this.imageUrl,
  });
}
