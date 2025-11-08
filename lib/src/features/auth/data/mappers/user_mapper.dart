import 'package:spend_flutter_app/src/features/auth/data/entities/user_model.dart';
import 'package:spend_flutter_app/src/features/auth/domain/models/user_entity.dart';

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
    return models.map((model) => toEntity(model)).toList();
  }
}
