class CreateUserEntity {
  final String email;
  final bool emailVisibility;
  final String name;
  final String password;
  final String passwordConfirm;

  const CreateUserEntity({
    required this.email,
    required this.emailVisibility,
    required this.name,
    required this.password,
    required this.passwordConfirm,
  });
}
