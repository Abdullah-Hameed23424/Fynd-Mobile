import 'package:fynd/feature/auth/domain/entities/auth_entity.dart';

/// Model for auth
/// Convert API data to Entity

class AuthModel {
  final String id;

  const AuthModel({required this.id});

  /// Convert from Model to Entity
  AuthEntity toEntity() {
    return AuthEntity(id: id);
  }

  /// Convert from JSON
  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(id: json['id'] ?? '');
  }

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {'id': id};
  }
}
