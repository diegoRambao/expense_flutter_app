import 'package:spend_flutter_app/src/features/auth/domain/models/create_user_entity.dart';
import 'package:spend_flutter_app/src/features/auth/domain/models/user_entity.dart';
import 'package:spend_flutter_app/src/features/auth/domain/repositories/user_repository.dart';

class CreateUserUseCase {
  final UserRepository repository;

  CreateUserUseCase(this.repository);

  Future<UserEntity> execute(CreateUserEntity newUser) {
    return repository.createUser(newUser);
  }
}
