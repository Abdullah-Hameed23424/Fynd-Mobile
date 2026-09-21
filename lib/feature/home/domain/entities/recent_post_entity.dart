import 'package:fynd/core/enums/app_enums.dart';

class RecentPostEntity {
  final int id;
  final String title;
  final String description;
  final String location;
  final PostType type;
  final DateTime? createdAt;
  final String? imageUrl;
  final int categoryId;
  final String categoryName;

  const RecentPostEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.type,
    required this.createdAt,
    required this.imageUrl,
    required this.categoryId,
    required this.categoryName,
  });
}
