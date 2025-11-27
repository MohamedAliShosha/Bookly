import 'package:book_store_app/Features/home/data/models/book_model/book_model.dart';
import 'package:book_store_app/Features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:book_store_app/Features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:book_store_app/core/function/build_error_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListViewBlocConsumer extends StatefulWidget {
  const FeaturedBooksListViewBlocConsumer({
    super.key,
  });

  @override
  State<FeaturedBooksListViewBlocConsumer> createState() =>
      _FeaturedBooksListViewBlocConsumerState();
}

class _FeaturedBooksListViewBlocConsumerState
    extends State<FeaturedBooksListViewBlocConsumer> {
  List<BookModel> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksSuccess) {
          // add the coming books to the books list
          books.addAll(state.books);
        }

        if (state is FeaturedBooksPaginationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            buildErrorSnackBar(state.errMessage),
          );
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksSuccess ||
            state is FeaturedBooksPaginationLoading ||
            state is FeaturedBooksPaginationFailure) {
          return FeaturedBooksListView(
            // load the new books added to the existing ones
            books: books,
          );
        } else if (state is FeaturedBooksFailure) {
          return Center(
            child: Text(
              state.errMessage,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
