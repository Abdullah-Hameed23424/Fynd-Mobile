import 'package:fynd/core/utils/model_parser.dart';
import 'package:fynd/feature/home/domain/entities/category_entity.dart';

class CategoryModel {
  final int id;
  final String name;

  CategoryModel({required this.id, required this.name});

  factory CategoryModel.fromMap(Map<String, dynamic> json) {
    return CategoryModel(
      id: ModelParser.intValue(json['id']),
      name: ModelParser.stringValue(json['name']),
    );
  }
  CategoryEntity toEntity() {
    return CategoryEntity(id: id, name: name);
  }
}
