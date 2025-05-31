import 'package:book_store_app/core/utils/api_service.dart';
import 'package:book_store_app/features/home/data/repos/home_repo_implement.dart';
import 'package:book_store_app/features/search/data/repos/search_repo_implement.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setUpServiceLocator() {
  // Register the ApiService as a singleton
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );

  // Register your services here with identifying the service name inside <>
  getIt.registerSingleton<HomeRepoImplement>(
    HomeRepoImplement(
      getIt.get<
          ApiService>(), // Locating the ApiService instance inside the HomeRepoImplement
    ),
  );
  getIt.registerSingleton<SearchRepoImplement>(
    SearchRepoImplement(
      getIt.get<
          ApiService>(), // Locating the ApiService instance inside the HomeRepoImplement
    ),
  );
}
