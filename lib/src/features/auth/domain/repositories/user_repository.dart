import 'package:spend_flutter_app/src/features/auth/domain/models/create_user_entity.dart';

import '../models/user_entity.dart';

abstract class UserRepository {
  Future<List<UserEntity>> getUsers();
  Future<UserEntity> createUser(CreateUserEntity user);
}
