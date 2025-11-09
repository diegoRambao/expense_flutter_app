import '../../domain/models/create_user_entity.dart';
import '../../domain/models/user_entity.dart';
import '../entities/create_user_model.dart';
import '../entities/user_model.dart';

class UserMapper {
  static UserEntity toEntity(UserModel model) {
    return UserEntity(
      id: model.id,
      email: model.email,
      name: model.name,
      avatar: model.avatar,
      verified: model.verified,
    );
  }

  static List<UserEntity> toEntityList(List<UserModel> models) {
    return models.map(toEntity).toList();
  }

  static CreateUserModel toCreateModel(CreateUserEntity entity) {
    return CreateUserModel(
      email: entity.email,
      emailVisibility: entity.emailVisibility,
      name: entity.name,
      password: entity.password,
      passwordConfirm: entity.passwordConfirm,
    );
  }
}
