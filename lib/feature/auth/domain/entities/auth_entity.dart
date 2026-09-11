/// Entity for auth

class AuthEntity {
  final String id;

  const AuthEntity({
    required this.id,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthEntity &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'AuthEntity(id: $id)';
}
