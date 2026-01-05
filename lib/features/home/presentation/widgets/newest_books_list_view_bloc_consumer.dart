import 'package:book_store_app/Features/home/data/models/book_model/book_model.dart';
import 'package:book_store_app/Features/home/presentation/manger/newest_books_cubit/new1_cubit/new1_books_cubit.dart';
import 'package:book_store_app/Features/home/presentation/widgets/newest_books_list_view.dart';
import 'package:book_store_app/core/function/build_error_snack_bar.dart';
import 'package:book_store_app/core/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksListViewBlocConsumer extends StatefulWidget {
  const NewestBooksListViewBlocConsumer({
    super.key,
  });

  @override
  State<NewestBooksListViewBlocConsumer> createState() =>
      _NewestBooksListViewBlocConsumerState();
}

class _NewestBooksListViewBlocConsumerState
    extends State<NewestBooksListViewBlocConsumer> {
  List<BookModel> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<New1BooksCubit, New1BooksState>(
      listener: (context, state) {
        if (state is New1BooksSuccess) {
          // add the coming books to the books list
          books.addAll(state.books);
        }

        if (state is New1BooksPaginationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            buildErrorSnackBar(state.errMessage),
          );
        }
      },
      builder: (context, state) {
        if (state is New1BooksSuccess ||
            state is New1BooksPaginationLoading ||
            state is New1BooksPaginationFailure) {
          return NewestBooksListView(
            // load the new books added to the existing ones
            books: books,
          );
        } else if (state is New1BooksFailure) {
          return CustomErrorWidget(errorMessage: state.errMessage);
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
