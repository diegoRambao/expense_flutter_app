import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spend_flutter_app/src/core/errors/exceptions.dart';
import 'package:spend_flutter_app/src/features/auth/data/entities/create_user_model.dart';
import 'package:spend_flutter_app/src/features/auth/data/entities/user_model.dart';

import '../entities/user_response_model.dart';

abstract class UserRemoteDataSource {
  Future<UserResponseModel> getUsers();
  Future<UserModel> createUser(CreateUserModel user);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final String baseUrl;

  UserRemoteDataSourceImpl({required this.baseUrl});

  @override
  Future<UserResponseModel> getUsers() async {
    final response = await http.get(Uri.parse('$baseUrl/users'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return UserResponseModel.fromJson(jsonData);
    } else {
      throw Exception('Error al obtener los usuarios');
    }
  }

  @override
  Future<UserModel> createUser(CreateUserModel user) async {
    final response = await http.post(
      Uri.parse('$baseUrl/collections/users/records'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user.toJson()),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      final body = json.decode(response.body);

      if (body['data'] != null && body['data']['email'] != null) {
        final emailError = body['data']['email'];
        throw UserEmailException(emailError.toString());
      }

      // 👇 manejo genérico
      throw Exception(body['raw'] ?? 'Error desconocido al crear usuario');
    }
  }
}
