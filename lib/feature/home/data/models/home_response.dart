import 'package:fynd/feature/home/data/models/category_model.dart';
import 'package:fynd/feature/home/data/models/recent_post_model.dart';
import 'package:fynd/feature/home/domain/entities/home_entity.dart';

class HomeResponse {
  final List<RecentPostModel> recentPosts;
  final List<CategoryModel> categories;

  HomeResponse({required this.recentPosts, required this.categories});

  factory HomeResponse.fromMap(Map<String, dynamic> json) => HomeResponse(
    recentPosts: List<RecentPostModel>.from(
      json['recentPosts'].map((x) => RecentPostModel.fromMap(x)),
    ),
    categories: List<CategoryModel>.from(
      json['categories'].map((x) => CategoryModel.fromMap(x)),
    ),
  );

  HomeEntity toEntity() {
    return HomeEntity(
      recentPosts: recentPosts.map((post) => post.toEntity()).toList(),
      categories: categories.map((category) => category.toEntity()).toList(),
    );
  }
}
