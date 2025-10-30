import '../../Features/search/data/repos/search_repo.dart';
import '../../Features/search/presentation/search_cubit/search_cubit.dart';
import '../../Features/search/presentation/view/search_view.dart';

import '../../Features/home/data/models/book_model/book_model.dart';
import '../../Features/home/data/repos/home_repo.dart';
import '../../Features/home/data/repos/home_repo_impl.dart';
import '../../Features/home/presentation/manger/smilar_books_cubit/similar_books_cubit.dart';
import '../../Features/home/presentation/views/book_details_view.dart';
import '../../Features/home/presentation/views/home_view.dart';
import '../services/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../Features/Splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path:
            kSearchView, // The path that will be used to navigate to the home screen
        builder: (context, state) => BlocProvider(
          create: (context) => SearchCubit(
            getIt<SearchRepo>(),
          ),
          child: const SearchView(),
        ),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(
            getIt.get<HomeRepoImplement>() as HomeRepo,
          ),
          child: BookDetailsView(
            bookModel: state.extra as BookModel,
          ),
        ),
      ),
    ],
  );
}
