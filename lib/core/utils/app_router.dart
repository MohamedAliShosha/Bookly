import 'package:book_store_app/features/details/presentation/views/details_view.dart';
import 'package:book_store_app/features/home/presentation/views/home_view.dart';
import 'package:book_store_app/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kDetailsView = '/detailsView';
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
            kDetailsView, // The path that will be used to navigate to the home screen
        builder: (context, state) => const DetailsView(),
      ),
    ],
  );
}
