import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fynd/core/errors/error_handler/exception_handler.dart';
import 'package:fynd/feature/home/domain/entities/recent_post_entity.dart';
import 'package:fynd/feature/posts/domain/usecases/get_recent_posts_use_case.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  final GetRecentPostsUseCase getRecentPostsUseCase;
  PostsCubit({required this.getRecentPostsUseCase}) : super(PostsInitial());

  Future<void> getRecentPosts() async {
    emit(RecentPostsLoading());

    try {
      final List<RecentPostEntity> recentPosts = await getRecentPostsUseCase();

      if (isClosed) return;
      emit(RecentPostsLoaded(recentPosts: recentPosts));
    } catch (e, s) {
      if (isClosed) return;
      logApiName('getRecentPosts');
      emit(RecentPostsError(msg: handleError(e, stackTrace: s)));
    }
  }
}
