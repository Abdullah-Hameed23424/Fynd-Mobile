import 'package:fynd/core/utils/model_parser.dart';
import 'package:fynd/feature/posts/data/models/post_model.dart';
import 'package:fynd/feature/posts/domain/entities/post_entity.dart';
import 'package:fynd/feature/posts/domain/entities/post_response_entity.dart';

class PostResponseModel extends PostResponseEntity {
  PostResponseModel({
    required super.posts,
    required super.page,
    required super.pageSize,
    required super.totalCount,
    required super.totalPages,
  });

  factory PostResponseModel.fromMap(Map<String, dynamic> json) {
    return PostResponseModel(
      posts: (json['posts'] as List)
          .map<PostEntity>((x) => PostModel.fromMap(x))
          .toList(),
      page: ModelParser.intValue(json['page']),
      pageSize: ModelParser.intValue(json['pageSize']),
      totalCount: ModelParser.intValue(json['totalCount']),
      totalPages: ModelParser.intValue(json['totalPages']),
    );
  }
}
