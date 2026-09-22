part of 'posts_cubit.dart';

sealed class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object> get props => [];
}

final class PostsInitial extends PostsState {}

final class RecentPostsLoading extends PostsState {}

final class RecentPostsLoaded extends PostsState {
  final List<RecentPostEntity> recentPosts;
  const RecentPostsLoaded({required this.recentPosts});

  @override
  List<Object> get props => [recentPosts];
}

final class RecentPostsError extends PostsState {
  final String msg;
  const RecentPostsError({required this.msg});

  @override
  List<Object> get props => [msg];
}
