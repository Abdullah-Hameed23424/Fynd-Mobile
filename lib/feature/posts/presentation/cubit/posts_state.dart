part of 'posts_cubit.dart';

sealed class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object> get props => [];
}

final class PostsInitial extends PostsState {}

final class RecentPostsLoading extends PostsState {}

final class RecentPostsLoaded extends PostsState {
  final List<PostEntity> recentPosts;
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

final class PostsLoading extends PostsState {}

final class PostsLoaded extends PostsState {
  final PostResponseEntity postResponseEntity;
  const PostsLoaded({required this.postResponseEntity});

  @override
  List<Object> get props => [postResponseEntity];
}

final class PostsError extends PostsState {
  final String msg;
  const PostsError({required this.msg});

  @override
  List<Object> get props => [msg];
}

final class CategoriesLoading extends PostsState {}

final class CategoriesLoaded extends PostsState {
  final List<CategoryEntity> categories;
  const CategoriesLoaded({required this.categories});

  @override
  List<Object> get props => [categories];
}

final class CategoriesError extends PostsState {
  final String msg;
  const CategoriesError({required this.msg});

  @override
  List<Object> get props => [msg];
}

final class CreatePostLoading extends PostsState {}

final class CreatePostSuccess extends PostsState {}

final class CreatePostError extends PostsState {
  final String msg;
  const CreatePostError({required this.msg});

  @override
  List<Object> get props => [msg];
}

final class MyPostsLoading extends PostsState {}

final class MyPostsLoaded extends PostsState {
  final PostResponseEntity postResponseEntity;
  const MyPostsLoaded({required this.postResponseEntity});

  @override
  List<Object> get props => [postResponseEntity];
}

final class MyPostsError extends PostsState {
  final String msg;
  const MyPostsError({required this.msg});

  @override
  List<Object> get props => [msg];
}

final class PostDetailsLoading extends PostsState {}

final class PostDetailsLoaded extends PostsState {
  final PostEntity postEntity;
  const PostDetailsLoaded({required this.postEntity});

  @override
  List<Object> get props => [postEntity];
}

final class PostDetailsError extends PostsState {
  final String msg;
  const PostDetailsError({required this.msg});

  @override
  List<Object> get props => [msg];
}
