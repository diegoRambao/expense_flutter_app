class UserEntity {
  final String id;
  final String email;
  final String name;
  final String avatar;
  final bool verified;

  const UserEntity({
    required this.id,
    required this.email,
    required this.name,
    required this.avatar,
    required this.verified,
  });
}
