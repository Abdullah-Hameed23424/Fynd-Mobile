class ProfileEntity {
  final int id;
  final String userName;
  final String email;
  final String phoneNumber;
  final DateTime? createdAt;

  ProfileEntity({
    required this.id,
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.createdAt,
  });
}
