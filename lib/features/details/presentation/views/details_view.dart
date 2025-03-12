import 'package:book_store_app/features/details/presentation/widgets/book_details_view_body.dart';
import 'package:book_store_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.bookModel});

  final BookModel
      bookModel; // 1 The book model that will be passed to the details view

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BookDetailViewBody(
        bookModel: bookModel,
      ),
    );
  }
}
