import 'dart:convert';

import 'package:http/http.dart' as http;

import '../entities/user_response_model.dart';

abstract class UserRemoteDataSource {
  Future<UserResponseModel> getUsers();
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
}
