import 'package:fynd/feature/splash/domain/entities/splash_entity.dart';

/// Model for splash
/// Convert API data to Entity

class SplashModel {
  final String id;

  const SplashModel({required this.id});

  /// Convert from Model to Entity
  SplashEntity toEntity() {
    return SplashEntity(id: id);
  }

  /// Convert from JSON
  factory SplashModel.fromJson(Map<String, dynamic> json) {
    return SplashModel(id: json['id'] ?? '');
  }

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {'id': id};
  }
}
