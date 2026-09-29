import 'package:fynd/core/utils/model_parser.dart';
import 'package:fynd/feature/home/domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({required super.id, required super.name});

  factory CategoryModel.fromMap(Map<String, dynamic> json) {
    return CategoryModel(
      id: ModelParser.intValue(json['id']),
      name: ModelParser.stringValue(json['name']),
    );
  }
}
