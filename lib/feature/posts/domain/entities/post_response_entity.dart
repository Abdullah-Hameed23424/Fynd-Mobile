import 'package:fynd/feature/posts/domain/entities/post_entity.dart';

class PostResponseEntity {
  final List<PostEntity> posts;
  final int page;
  final int pageSize;
  final int totalCount;
  final int totalPages;

  PostResponseEntity({
    required this.posts,
    required this.page,
    required this.pageSize,
    required this.totalCount,
    required this.totalPages,
  });
}
