import 'package:book_store_app/features/home/home_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';

  static final routes = [
    GoRouter(routes: [
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
    ]),
  ];
}
