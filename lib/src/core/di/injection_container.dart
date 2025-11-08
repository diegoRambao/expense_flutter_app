import 'package:get_it/get_it.dart';
import 'package:spend_flutter_app/src/features/auth/data/datasources/user_remote_datasource.dart';
import 'package:spend_flutter_app/src/features/auth/data/repositories/user_repository_impl.dart';
import 'package:spend_flutter_app/src/features/auth/domain/repositories/user_repository.dart';
import 'package:spend_flutter_app/src/features/auth/domain/usecases/get_users_usecase.dart';

final sl = GetIt.instance; // sl = service locator

Future<void> initDependencies() async {
  // 💡 DataSource
  sl.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(baseUrl: 'https://api.tuapp.com'),
  );

  // 💡 Repository
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(remoteDataSource: sl()),
  );

  // 💡 UseCase
  sl.registerLazySingleton<GetUsersUseCase>(() => GetUsersUseCase(sl()));
}
