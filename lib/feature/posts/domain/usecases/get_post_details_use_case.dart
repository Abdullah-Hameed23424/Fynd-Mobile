import 'package:fynd/feature/posts/domain/entities/post_entity.dart';
import 'package:fynd/feature/posts/domain/repositories/posts_repository.dart';

class GetPostDetailsUseCase {
  final PostsRepository repository;
  GetPostDetailsUseCase(this.repository);

  Future<PostEntity> call({required int postId, required int postType}) {
    return repository.getPostDetails(postId: postId, postType: postType);
  }
}
