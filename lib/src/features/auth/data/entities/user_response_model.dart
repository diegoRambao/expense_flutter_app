import 'user_model.dart';

class UserResponseModel {
  final int page;
  final int perPage;
  final int totalPages;
  final int totalItems;
  final List<UserModel> items;

  UserResponseModel({
    required this.page,
    required this.perPage,
    required this.totalPages,
    required this.totalItems,
    required this.items,
  });

  factory UserResponseModel.fromJson(Map<String, dynamic> json) {
    return UserResponseModel(
      page: json['page'] ?? 0,
      perPage: json['perPage'] ?? 0,
      totalPages: json['totalPages'] ?? 0,
      totalItems: json['totalItems'] ?? 0,
      items: (json['items'] as List<dynamic>)
          .map((e) => UserModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'page': page,
        'perPage': perPage,
        'totalPages': totalPages,
        'totalItems': totalItems,
        'items': items.map((e) => e.toJson()).toList(),
      };
}
