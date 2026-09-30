import 'package:fynd/feature/home/data/models/category_model.dart';
import 'package:fynd/feature/home/domain/entities/category_entity.dart';
import 'package:fynd/feature/posts/domain/params/post_filter.dart';
import 'package:fynd/feature/posts/data/models/post_model.dart';
import 'package:fynd/feature/posts/data/models/post_response_model.dart';
import 'package:fynd/feature/posts/domain/entities/post_entity.dart';
import 'package:fynd/feature/posts/domain/entities/post_response_entity.dart';
import 'package:fynd/feature/posts/domain/repositories/posts_repository.dart';
import 'package:fynd/feature/posts/data/datasources/posts_remote_data_source.dart';

class PostsRepositoryImpl implements PostsRepository {
  final PostsRemoteDataSource remoteDataSource;
  PostsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<PostEntity>> getRecentPosts() async {
    final response = await remoteDataSource.getRecentPosts();

    final recentPosts = (response.data as List)
        .map((item) => PostModel.fromMap(item))
        .toList();

    return recentPosts;
  }

  @override
  Future<PostResponseEntity> getPosts(PostFilter filter) async {
    final response = await remoteDataSource.getPosts(filter);

    return PostResponseModel.fromMap(response.data);
  }

  @override
  Future<List<CategoryEntity>> getCategories() async {
    final response = await remoteDataSource.getCategories();

    final List<CategoryModel> categories = (response.data as List)
        .map((item) => CategoryModel.fromMap(item))
        .toList();

    return categories;
  }

  @override
  Future<void> createPost({required Map<String, dynamic> data}) async {
    await remoteDataSource.createPost(data: data);
  }

  @override
  Future<PostResponseEntity> getMyPosts() async {
    final response = await remoteDataSource.getMyPosts();

    return PostResponseModel.fromMap(response.data);
  }

  @override
  Future<PostEntity> getPostDetails({
    required int postId,
    required int postType,
  }) async {
    final response = await remoteDataSource.getPostDetails(
      postId: postId,
      postType: postType,
    );

    return PostModel.fromMap(response.data);
  }
}
