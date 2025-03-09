import 'package:book_store_app/constants.dart';
import 'package:book_store_app/core/utils/app_router.dart';
import 'package:book_store_app/core/utils/service_locator.dart';
import 'package:book_store_app/features/home/data/repos/home_repo_implement.dart';
import 'package:book_store_app/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:book_store_app/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class BookStore extends StatelessWidget {
  const BookStore({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
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
          ),
        ),
      ],
      child: MaterialApp.router(
        theme: ThemeData(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.interTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}

void main() {
  setUpServiceLocator();
  runApp(
    const BookStore(),
  );
}
