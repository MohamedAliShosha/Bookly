import 'api_service.dart';
import '../../features/home/data/repos/home_repo_implement.dart';
import '../../features/search/data/repos/search_repo_implement.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setUpServiceLocator() {
  getIt.registerLazySingleton<Dio>(
    () => Dio(),
  );

  // Register the ApiService as a singleton
  getIt.registerSingleton<ApiService>(
    ApiService(
      getIt<Dio>(),
    ),
  );

  // Register your services here with identifying the service name inside <>
  getIt.registerSingleton<HomeRepoImplement>(
    HomeRepoImplement(
      getIt<
          ApiService>(), // Locating the ApiService instance inside the HomeRepoImplement
    ),
  );
  getIt.registerSingleton<SearchRepoImplement>(
    SearchRepoImplement(
      getIt<
          ApiService>(), // Locating the ApiService instance inside the HomeRepoImplement
    ),
  );
}
