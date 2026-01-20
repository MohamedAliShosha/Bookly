import 'package:book_store_app/Features/home/presentation/manger/newest_books_cubit/new1_cubit/new1_books_cubit.dart';
import 'package:book_store_app/core/utils/shared_pref_helper.dart';
import 'package:book_store_app/core/utils/shared_pref_keys.dart';
import 'package:book_store_app/core/utils/simple_bloc_observer.dart';
import 'Features/home/data/repos/home_repo_impl.dart';
import 'Features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'constants.dart';
import 'core/utils/app_router.dart';
import 'core/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await checkIfUserIsLoggedIn();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  setUpGetIt();
  Bloc.observer = SimpleBlocObserver();
  runApp(const Bookly());
}

Future<void> checkIfUserIsLoggedIn() async {
  // Getting userToken and storing it in a variable
  final userToken =
      await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
  // Check if the userToken is not null and not empty

  if (userToken != null && userToken.isNotEmpty) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            getIt.get<HomeRepoImplement>(),
          )..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => New1BooksCubit(
            getIt.get<HomeRepoImplement>(),
          )..fetchNewestBooks(),
        )
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
      ),
    );
  }
}
