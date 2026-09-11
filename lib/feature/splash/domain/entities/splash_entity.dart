/// Entity for splash

class SplashEntity {
  final String id;

  const SplashEntity({
    required this.id,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SplashEntity &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'SplashEntity(id: $id)';
}
