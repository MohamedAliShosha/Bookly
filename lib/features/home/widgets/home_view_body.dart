import 'package:book_store_app/constants.dart';
import 'package:book_store_app/core/utils/styles.dart';
import 'package:book_store_app/features/home/widgets/custom_app_bar.dart';
import 'package:book_store_app/features/home/widgets/featured_books_list_view.dart';
import 'package:book_store_app/features/home/widgets/newest_book_list_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: CustomAppBar(),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                child: Row(
                  children: [
                    Text(
                      'For You',
                      style: Styles.textStyle16.copyWith(
                          fontFamily: GoogleFonts.ruslanDisplay().fontFamily),
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        Text(
                          'View all',
                          style: Styles.textStyle16.copyWith(
                            fontFamily: GoogleFonts.ruslanDisplay().fontFamily,
                          ),
                        ),
                        const SizedBox(
                          height: 0,
                          width: 100,
                          child: Divider(
                            thickness: 2,
                            color: kSecondaryColor,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const FeaturedBooksListView(),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  'Newest Books',
                  style: Styles.textStyle18.copyWith(
                    fontFamily: GoogleFonts.ruslanDisplay().fontFamily,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        const SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: NewestBookListView(),
          ),
        ),
      ],
    );
  }
}
