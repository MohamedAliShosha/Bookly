import 'package:book_store_app/Features/home/data/models/book_model/book_model.dart';
import 'package:book_store_app/core/utils/app_router.dart';
import 'package:go_router/go_router.dart';

import '../manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_book_item.dart';

class FeaturedBooksListView extends StatefulWidget {
  const FeaturedBooksListView({super.key, required this.books});

  final List<BookModel> books;

  @override
  State<FeaturedBooksListView> createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
  // Scroll controller used to monitor the scrolling position in the ListView
  late final ScrollController _scrollController;
  var nextPage = 1; // The next page number to request from the API

  // A flag to prevent triggering multiple loading operations at once
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    // Initialize the ScrollController when the state is created
    _scrollController = ScrollController();
    // Add a listener to react whenever the user scrolls
    _scrollController.addListener(scrollListener);
  }

  // Function executed every time the scroll position changes
  void scrollListener() async {
    // The current scroll position in pixels
    var currentPosition = _scrollController.position.pixels;
    // The maximum scroll extent (the furthest point the list can scroll to)
    var maxScrollExtent = _scrollController.position.maxScrollExtent;
    // If the user has reached 70% of the scrollable area
    if (currentPosition >= 0.7 * maxScrollExtent) {
      // Only load more data if no loading operation is currently happening
      if (!isLoading) {
        isLoading =
            true; /* 
            - Now loading starts
            - Prevents the block from triggering again
*/
        // Call the Cubit to fetch the next page of books from the API

        await BlocProvider.of<FeaturedBooksCubit>(context).fetchFeaturedBooks(
          pageNumber: nextPage++, // Pass the page number, then increment it
        );
        isLoading =
            false; /*
            - → Ready to load next page when user scrolls again
            - → Next scroll: if(!false) → true
            - And the cycle repeats.
             */
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: widget.books.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: () {
                GoRouter.of(context).push(
                  AppRouter.kBookDetailsView,
                  extra: widget.books[index],
                );
              },
              child: CustomBookItem(
                image:
                    widget.books[index].volumeInfo.imageLinks?.thumbnail ?? '',
              ),
            ),
          );
        },
      ),
    );
  }
}
