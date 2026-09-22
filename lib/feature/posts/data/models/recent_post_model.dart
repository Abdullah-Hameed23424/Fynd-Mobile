import 'package:fynd/core/enums/app_enums.dart';
import 'package:fynd/core/utils/model_parser.dart';
import 'package:fynd/feature/posts/domain/entities/recent_posts_entity.dart';

class RecentPostModel {
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

  RecentPostModel({
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

  factory RecentPostModel.fromMap(Map<String, dynamic> json) => RecentPostModel(
    id: ModelParser.intValue(json['id']),
    title: ModelParser.stringValue(json['title']),
    description: ModelParser.stringValue(json['description']),
    location: ModelParser.stringValue(json['location']),
    date: ModelParser.stringValue(json['date']),
    type: json['type'] == 0 ? PostType.lost : PostType.found,
    createdAt: ModelParser.dateTimeValue(json['createdAt']),
    userId: ModelParser.intValue(json['userId']),
    categoryId: ModelParser.intValue(json['categoryId']),
    categoryName: ModelParser.stringValue(json['categoryName']),
    imageUrl: ModelParser.stringValue(json['imageUrl']),
  );

  RecentPostEntity toEntity() {
    return RecentPostEntity(
      id: id,
      title: title,
      description: description,
      location: location,
      date: date,
      type: type,
      createdAt: createdAt,
      userId: userId,
      categoryId: categoryId,
      categoryName: categoryName,
      imageUrl: imageUrl,
    );
  }
}
