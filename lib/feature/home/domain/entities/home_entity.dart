import 'package:equatable/equatable.dart';
import 'package:fynd/feature/home/domain/entities/category_entity.dart';
import 'package:fynd/feature/home/domain/entities/recent_post_entity.dart';

class HomeEntity extends Equatable {
  final List<RecentPostEntity> recentPosts;
  final List<CategoryEntity> categories;

  const HomeEntity({required this.recentPosts, required this.categories});

  @override
  List<Object> get props => [recentPosts, categories];
}
