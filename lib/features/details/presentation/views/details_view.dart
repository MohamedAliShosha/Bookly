import '../../../../core/utils/colors_manager.dart';
import '../widgets/book_details_view_body.dart';
import '../../../home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.bookModel});

  final BookModel
      bookModel; // 1 The book model that will be passed to the details view

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManager.kPrimaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: ColorsManager.kSecondaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BookDetailViewBody(
        bookModel: bookModel,
      ),
    );
  }
}
