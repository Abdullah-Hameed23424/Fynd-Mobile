import 'package:fynd/core/enums/app_enums.dart';
import 'package:fynd/core/utils/model_parser.dart';
import 'package:fynd/feature/home/domain/entities/recent_post_entity.dart';

class RecentPostModel {
  final int id;
  final String title;
  final String description;
  final String location;
  final PostType type;
  final DateTime? createdAt;
  final String? imageUrl;
  final int categoryId;
  final String categoryName;

  RecentPostModel({
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

  factory RecentPostModel.fromMap(Map<String, dynamic> json) => RecentPostModel(
    id: ModelParser.intValue(json['id']),
    title: ModelParser.stringValue(json['title']),
    description: ModelParser.stringValue(json['description']),
    location: ModelParser.stringValue(json['location']),
    type: json['type'] == 0 ? PostType.lost : PostType.found,
    createdAt: ModelParser.dateTimeValue(json['createdAt']),
    imageUrl: ModelParser.stringValue(json['imageUrl']),
    categoryId: ModelParser.intValue(json['categoryId']),
    categoryName: ModelParser.stringValue(json['categoryName']),
  );

  RecentPostEntity toEntity() {
    return RecentPostEntity(
      id: id,
      title: title,
      description: description,
      location: location,
      type: type,
      createdAt: createdAt,
      imageUrl: imageUrl,
      categoryId: categoryId,
      categoryName: categoryName,
    );
  }
}
