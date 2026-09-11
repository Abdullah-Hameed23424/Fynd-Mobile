import 'package:fynd/feature/home/domain/entities/home_entity.dart';

/// Model for home
/// Convert API data to Entity

class HomeModel {
  final String id;

  const HomeModel({required this.id});

  /// Convert from Model to Entity
  HomeEntity toEntity() {
    return HomeEntity(id: id);
  }

  /// Convert from JSON
  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(id: json['id'] ?? '');
  }

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {'id': id};
  }
}
