import 'package:book_store_app/features/home/home_view.dart';
import 'package:book_store_app/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';

  static final routes = [
    GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const SplashView(),
        ),
      ],
    ),
    GoRouter(
      routes: [
        GoRoute(
          path: kHomeView,
          builder: (context, state) => const HomeView(),
        ),
      ],
    ),
  ];
}
