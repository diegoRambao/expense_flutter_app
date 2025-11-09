class UserModel {
  final String? id;
  final String email;
  final bool emailVisibility;
  final bool verified;
  final String name;
  final String avatar;
  final String collectionId;
  final String collectionName;
  final DateTime created;
  final DateTime updated;

  UserModel({
    this.id,
    required this.email,
    required this.emailVisibility,
    required this.verified,
    required this.name,
    required this.avatar,
    required this.collectionId,
    required this.collectionName,
    required this.created,
    required this.updated,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      emailVisibility: json['emailVisibility'] ?? false,
      verified: json['verified'] ?? false,
      name: json['name'] ?? '',
      avatar: json['avatar'] ?? '',
      collectionId: json['collectionId'] ?? '',
      collectionName: json['collectionName'] ?? '',
      created: DateTime.parse(json['created']),
      updated: DateTime.parse(json['updated']),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email,
    'emailVisibility': emailVisibility,
    'verified': verified,
    'name': name,
    'avatar': avatar,
    'collectionId': collectionId,
    'collectionName': collectionName,
    'created': created.toIso8601String(),
    'updated': updated.toIso8601String(),
  };
}
