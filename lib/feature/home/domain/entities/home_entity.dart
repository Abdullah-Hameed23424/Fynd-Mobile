/// Entity for home

class HomeEntity {
  final String id;

  const HomeEntity({
    required this.id,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeEntity &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'HomeEntity(id: $id)';
}
