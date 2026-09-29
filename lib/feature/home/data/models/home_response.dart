import 'package:fynd/feature/home/data/models/category_model.dart';
import 'package:fynd/feature/posts/data/models/post_model.dart';
import 'package:fynd/feature/home/domain/entities/home_entity.dart';

class HomeResponse extends HomeEntity {
  const HomeResponse({required super.recentPosts, required super.categories});

  factory HomeResponse.fromMap(Map<String, dynamic> json) => HomeResponse(
    recentPosts: List<PostModel>.from(
      json['recentPosts'].map((x) => PostModel.fromMap(x)),
    ),
    categories: List<CategoryModel>.from(
      json['categories'].map((x) => CategoryModel.fromMap(x)),
    ),
  );
}
