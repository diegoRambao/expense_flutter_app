import 'package:spend_flutter_app/src/features/auth/domain/models/create_user_entity.dart';
import 'package:spend_flutter_app/src/features/auth/domain/repositories/user_repository.dart';

import '../../domain/models/user_entity.dart';
import '../datasources/user_remote_datasource.dart';
import '../mappers/user_mapper.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<UserEntity>> getUsers() async {
    final responseModel = await remoteDataSource.getUsers();
    return UserMapper.toEntityList(responseModel.items);
  }

  @override
  Future<UserEntity> createUser(CreateUserEntity newUser) async {
    final model = UserMapper.toCreateModel(newUser);
    final createdModel = await remoteDataSource.createUser(model);
    return UserMapper.toEntity(createdModel);
  }
}
