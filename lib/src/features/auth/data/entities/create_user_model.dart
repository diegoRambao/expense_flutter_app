class CreateUserModel {
  final String email;
  final bool emailVisibility;
  final String name;
  final String password;
  final String passwordConfirm;

  const CreateUserModel({
    required this.email,
    required this.emailVisibility,
    required this.name,
    required this.password,
    required this.passwordConfirm,
  });

  Map<String, dynamic> toJson() => {
    "email": email,
    "emailVisibility": emailVisibility,
    "name": name,
    "password": password,
    "passwordConfirm": passwordConfirm,
  };
}
