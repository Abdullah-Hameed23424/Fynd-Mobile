import 'package:fynd/core/enums/app_enums.dart';
import 'package:fynd/core/utils/model_parser.dart';
import 'package:fynd/feature/posts/domain/entities/post_entity.dart';

class PostModel extends PostEntity {
  PostModel({
    required super.id,
    required super.title,
    required super.description,
    required super.location,
    required super.type,
    required super.createdAt,
    required super.imageUrl,
    required super.categoryId,
    required super.categoryName,
    required super.date,
    required super.userId,
    required super.userEmail,
  });

  factory PostModel.fromMap(Map<String, dynamic> json) => PostModel(
    id: ModelParser.intValue(json['id']),
    title: ModelParser.stringValue(json['title']),
    description: ModelParser.stringValue(json['description']),
    location: ModelParser.stringValue(json['location']),
    type: json['type'] == 0 ? PostType.lost : PostType.found,
    createdAt: ModelParser.dateTimeValue(json['createdAt']),
    imageUrl: ModelParser.stringValue(json['imageUrl']),
    categoryId: ModelParser.intValue(json['categoryId']),
    categoryName: ModelParser.stringValue(json['categoryName']),
    date: ModelParser.dateTimeValue(json['data']),
    userId: ModelParser.intValue(json['userId']),
    userEmail: ModelParser.stringValue(json['userMail']),
  );
}
