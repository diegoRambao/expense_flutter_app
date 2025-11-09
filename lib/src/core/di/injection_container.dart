import 'package:get_it/get_it.dart';
import 'package:spend_flutter_app/src/features/auth/data/datasources/user_remote_datasource.dart';
import 'package:spend_flutter_app/src/features/auth/data/repositories/user_repository_impl.dart';
import 'package:spend_flutter_app/src/features/auth/domain/repositories/user_repository.dart';
import 'package:spend_flutter_app/src/features/auth/domain/usecases/create_user_usecase.dart';
import 'package:spend_flutter_app/src/features/auth/domain/usecases/get_users_usecase.dart';

final getIt = GetIt.instance; // sl = service locator

Future<void> initDependencies() async {
  // 💡 DataSource
  getIt.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(baseUrl: 'http://127.0.0.1:8090/api'),
  );

  // 💡 Repository
  getIt.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(remoteDataSource: getIt<UserRemoteDataSource>()),
  );

  // 💡 UseCase
  getIt.registerLazySingleton<GetUsersUseCase>(
    () => GetUsersUseCase(getIt<UserRepository>()),
  );
  getIt.registerLazySingleton<CreateUserUseCase>(
    () => CreateUserUseCase(getIt<UserRepository>()),
  );
}
