import 'package:fynd/feature/posts/data/datasources/posts_remote_data_source.dart';
import 'package:fynd/feature/posts/data/repositories/posts_repository_impl.dart';
import 'package:fynd/feature/posts/domain/usecases/create_post_use_case.dart';
import 'package:fynd/feature/posts/domain/usecases/get_categories_use_case.dart';
import 'package:fynd/feature/posts/domain/usecases/get_my_posts_use_case.dart';
import 'package:fynd/feature/posts/domain/usecases/get_post_details_use_case.dart';
import 'package:fynd/feature/posts/domain/usecases/get_posts_use_case.dart';
import 'package:fynd/feature/posts/domain/usecases/get_recent_posts_use_case.dart';
import 'package:fynd/feature/posts/presentation/cubit/posts_cubit.dart';

PostsCubit createPostsCubit() {
  final remoteDataSource = PostsRemoteDataSourceImpl();
  final repository = PostsRepositoryImpl(remoteDataSource: remoteDataSource);

  final getRecentPostsUseCase = GetRecentPostsUseCase(repository);
  final getPostsUseCase = GetPostsUseCase(repository);
  final getCategoriesUseCase = GetCategoriesUseCase(repository);
  final createPostUseCase = CreatePostUseCase(repository);
  final getMyPostsUseCase = GetMyPostsUseCase(repository);
  final getPostDetailsUseCase = GetPostDetailsUseCase(repository);

  return PostsCubit(
    getRecentPostsUseCase: getRecentPostsUseCase,
    getPostsUseCase: getPostsUseCase,
    getCategoriesUseCase: getCategoriesUseCase,
    createPostUseCase: createPostUseCase,
    getMyPostsUseCase: getMyPostsUseCase,
    getPostDetailsUseCase: getPostDetailsUseCase,
  );
}
