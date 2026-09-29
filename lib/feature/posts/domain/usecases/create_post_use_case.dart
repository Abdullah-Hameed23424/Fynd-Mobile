import 'package:fynd/feature/posts/domain/repositories/posts_repository.dart';

class CreatePostUseCase {
  final PostsRepository repository;
  CreatePostUseCase(this.repository);

  Future<void> call({required Map<String, dynamic> data}) async {
    return await repository.createPost(data: data);
  }
}
