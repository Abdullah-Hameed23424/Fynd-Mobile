import 'package:fynd/feature/posts/domain/params/post_filter.dart';

abstract class PostsHelper {
  static void onSelectedCategory(int? categoryId, PostFilter filter) {
    if (categoryId == null) return;

    filter = filter.copyWith(categoryId: categoryId, page: 1);
  }
}
