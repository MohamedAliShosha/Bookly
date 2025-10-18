import 'service_locator.dart';
import '../../features/details/presentation/views/details_view.dart';
import '../../features/home/data/models/book_model/book_model.dart';
import '../../features/home/data/repos/home_repo_implement.dart';
import '../../features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import '../../features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/search/data/repos/search_repo_implement.dart';
import '../../features/search/presentation/manager/SearchBookCubit/search_book_cubit.dart';
import '../../features/search/presentation/views/search_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';
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
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => FeaturedBooksCubit(
                // The HomeRepoImplement is the repeated code that can be replaced with a service locator
                getIt.get<HomeRepoImplement>(),
                // .. called a spread operator used to call a method on an object and return the object itself
              )..fetchFeaturedBooks(),
            ),
            BlocProvider(
              create: (context) => NewestBooksCubit(
                getIt.get<HomeRepoImplement>(),
              )..fetchNewestBooks(),
            ),
          ],
          child: const HomeView(),
        ),
      ),
      GoRoute(
        path:
            kSearchView, // The path that will be used to navigate to the home screen
        builder: (context, state) => BlocProvider(
          create: (context) => SearchCubit(
            getIt<SearchRepoImplement>(),
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
