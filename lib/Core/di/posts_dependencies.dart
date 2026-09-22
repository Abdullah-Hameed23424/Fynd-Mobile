import 'package:fynd/feature/posts/data/datasources/posts_remote_data_source.dart';
import 'package:fynd/feature/posts/data/repositories/posts_repository_impl.dart';
import 'package:fynd/feature/posts/domain/usecases/get_recent_posts_use_case.dart';
import 'package:fynd/feature/posts/presentation/cubit/posts_cubit.dart';

PostsCubit createPostsCubit() {
  final remoteDataSource = PostsRemoteDataSourceImpl();
  final repository = PostsRepositoryImpl(remoteDataSource: remoteDataSource);

  final getRecentPostsUseCase = GetRecentPostsUseCase(repository);

  return PostsCubit(getRecentPostsUseCase: getRecentPostsUseCase);
}
