import 'package:fynd/feature/home/domain/entities/category_entity.dart';
import 'package:fynd/feature/posts/domain/repositories/posts_repository.dart';

class GetCategoriesUseCase {
  final PostsRepository repository;
  GetCategoriesUseCase(this.repository);

  Future<List<CategoryEntity>> call() async {
    return await repository.getCategories();
  }
}
