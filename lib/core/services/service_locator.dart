import '../../Features/home/data/repos/home_repo_impl.dart';
import '../../Features/search/data/repos/seach_repo_implement.dart';
import '../../Features/search/data/repos/search_repo.dart';
import 'api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setUpGetIt() {
  getIt.registerLazySingleton<Dio>(
    () => Dio(),
  );

  getIt.registerLazySingleton<ApiService>(
    () => ApiService(
      getIt<Dio>(),
    ),
  );

  getIt.registerLazySingleton<SearchRepo>(
    () => SearchRepoImplement(
      getIt<ApiService>(),
    ),
  );

  getIt.registerSingleton<HomeRepoImplement>(
    HomeRepoImplement(
      getIt<ApiService>(),
    ),
  );
}
