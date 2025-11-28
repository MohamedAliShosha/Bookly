import 'package:book_store_app/Features/home/data/models/book_model/book_model.dart';
import 'package:book_store_app/Features/home/presentation/manger/smilar_books_cubit/similar_books_cubit.dart';
import 'package:book_store_app/Features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:book_store_app/core/function/build_error_snack_bar.dart';
import 'package:book_store_app/core/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksListViewBlocConsumer extends StatefulWidget {
  const SimilarBooksListViewBlocConsumer({
    super.key,
  });

  @override
  State<SimilarBooksListViewBlocConsumer> createState() =>
      _SimilarBooksListViewBlocConsumerState();
}

class _SimilarBooksListViewBlocConsumerState
    extends State<SimilarBooksListViewBlocConsumer> {
  List<BookModel> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SimilarBooksCubit, SimilarBooksState>(
      listener: (context, state) {
        if (state is SimilarBooksSuccess) {
          // add the coming books to the books list
          books.addAll(state.books);
        }

        if (state is SimilarBooksPaginationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            buildErrorSnackBar(state.errMessage),
          );
        }
      },
      builder: (context, state) {
        if (state is SimilarBooksSuccess ||
            state is SimilarBooksPaginationLoading ||
            state is SimilarBooksPaginationFailure) {
          return SimilarBooksListView(
            // load the new books added to the existing ones
            books: books,
          );
        } else if (state is SimilarBooksFailure) {
          return CustomErrorWidget(errorMessage: state.errMessage);
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
