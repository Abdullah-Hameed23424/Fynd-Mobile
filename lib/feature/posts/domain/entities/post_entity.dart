import 'package:fynd/core/enums/app_enums.dart';

class PostEntity {
  final int id;
  final String title;
  final String description;
  final String location;
  final DateTime? date;
  final PostType type;
  final DateTime? createdAt;
  final int userId;
  final String? imageUrl;
  final int categoryId;
  final String categoryName;

  const PostEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.type,
    required this.createdAt,
    required this.imageUrl,
    required this.categoryId,
    required this.categoryName,
    required this.date,
    required this.userId,
  });
}
