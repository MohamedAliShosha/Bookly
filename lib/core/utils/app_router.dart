import 'package:book_store_app/core/utils/service_locator.dart';
import 'package:book_store_app/features/details/presentation/views/details_view.dart';
import 'package:book_store_app/features/home/data/models/book_model/book_model.dart';
import 'package:book_store_app/features/home/presentation/views/home_view.dart';
import 'package:book_store_app/features/search/data/repos/search_repo_implement.dart';
import 'package:book_store_app/features/search/presentation/manager/SearchBookCubit/search_book_cubit.dart';
import 'package:book_store_app/features/search/presentation/views/search_view.dart';
import 'package:book_store_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kSearchView = '/searchView';
  static const kBookDetailsView = '/detailsView';
  // static used to make the method accessible without creating an instance of the class
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/', // This is the starting screen path of the app
        builder: (context, state) => const SplashView(), // The started screen
      ),
      GoRoute(
        path:
            kHomeView, // The path that will be used to navigate to the home screen
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path:
            kSearchView, // The path that will be used to navigate to the home screen
        builder: (context, state) => BlocProvider(
          create: (context) => SearchCubit(
            getIt.get<SearchRepoImplement>(),
          ),
          child: const SearchView(),
        ),
      ),
      GoRoute(
        path:
            kBookDetailsView, // The path that will be used to navigate to the home screen
        builder: (context, state) => DetailsView(
          bookModel: state.extra
              as BookModel, // 2 Sending the book model to the details view to be used in the details view
        ),
      ),
    ],
  );
}
