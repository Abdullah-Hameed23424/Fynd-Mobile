import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fynd/core/errors/error_handler/exception_handler.dart';
import 'package:fynd/feature/home/domain/entities/category_entity.dart';
import 'package:fynd/feature/posts/domain/params/post_filter.dart';
import 'package:fynd/feature/posts/domain/entities/post_entity.dart';
import 'package:fynd/feature/posts/domain/entities/post_response_entity.dart';
import 'package:fynd/feature/posts/domain/usecases/create_post_use_case.dart';
import 'package:fynd/feature/posts/domain/usecases/get_categories_use_case.dart';
import 'package:fynd/feature/posts/domain/usecases/get_posts_use_case.dart';
import 'package:fynd/feature/posts/domain/usecases/get_recent_posts_use_case.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  final GetRecentPostsUseCase getRecentPostsUseCase;
  final GetPostsUseCase getPostsUseCase;
  final GetCategoriesUseCase getCategoriesUseCase;
  final CreatePostUseCase createPostUseCase;
  PostsCubit({
    required this.getRecentPostsUseCase,
    required this.getPostsUseCase,
    required this.getCategoriesUseCase,
    required this.createPostUseCase,
  }) : super(PostsInitial());

  final RefreshController refreshController = RefreshController();

  Future<void> getRecentPosts() async {
    emit(RecentPostsLoading());

    try {
      final List<PostEntity> recentPosts = await getRecentPostsUseCase();

      if (isClosed) return;
      emit(RecentPostsLoaded(recentPosts: recentPosts));
    } catch (e, s) {
      if (isClosed) return;
      logApiName('getRecentPosts');
      emit(RecentPostsError(msg: handleError(e, stackTrace: s)));
    }
  }

  Future<void> getPosts({required PostFilter filter}) async {
    if (isClosed) return;

    final isFirstPage = filter.page == 1;
    if (isFirstPage) {
      refreshController.refreshToIdle();
      emit(PostsLoading());
    }

    try {
      final response = await getPostsUseCase(filter);
      if (isClosed) return;
      if (isFirstPage) {
        emit(PostsLoaded(postResponseEntity: response));

        refreshController.refreshCompleted();
      } else {
        if (state is! PostsLoaded) return;
        final currentResponse = (state as PostsLoaded).postResponseEntity;
        final updatedResponse = PostResponseEntity(
          posts: [...currentResponse.posts, ...response.posts],
          page: response.page,
          pageSize: response.pageSize,
          totalCount: response.totalCount,
          totalPages: response.totalPages,
        );
        emit(PostsLoaded(postResponseEntity: updatedResponse));

        refreshController.loadComplete();
      }
      if (response.page >= response.totalPages) {
        refreshController.loadNoData();
      }
    } catch (e, s) {
      if (isClosed) return;
      logApiName('getPosts');
      if (isFirstPage) {
        refreshController.refreshFailed();
        emit(PostsError(msg: handleError(e, stackTrace: s)));
      } else {
        refreshController.loadFailed();
      }
    }
  }

  Future<void> getCategories() async {
    emit(CategoriesLoading());

    try {
      final List<CategoryEntity> categories = await getCategoriesUseCase();

      if (isClosed) return;
      emit(CategoriesLoaded(categories: categories));
    } catch (e, s) {
      if (isClosed) return;
      logApiName('getCategories');
      emit(CategoriesError(msg: handleError(e, stackTrace: s)));
    }
  }

  Future<void> createPost({required Map<String, dynamic> data}) async {
    emit(CreatePostLoading());

    try {
      await createPostUseCase(data: data);

      if (isClosed) return;
      emit(CreatePostSuccess());
    } catch (e, s) {
      if (isClosed) return;
      logApiName('createPost');
      emit(CreatePostError(msg: handleError(e, stackTrace: s)));
    }
  }
}
