import 'package:book_store_app/core/utils/styles.dart';
import 'package:book_store_app/features/home/widgets/custom_app_bar.dart';
import 'package:book_store_app/features/home/widgets/featured_books_list_view.dart';
import 'package:book_store_app/features/home/widgets/newest_books_list_view.dart';
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
                      style: Styles.txtStyle16.copyWith(
                          fontFamily: GoogleFonts.ruslanDisplay().fontFamily),
                    ),
                  ],
                ),
              ),
              const FeaturedBooksListView(),
              const SizedBox(
                height: 50,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Newest Books',
                  style: Styles.txtStyle18,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        const SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: NewestBooksListView(),
          ),
        ),
      ],
    );
  }
}
