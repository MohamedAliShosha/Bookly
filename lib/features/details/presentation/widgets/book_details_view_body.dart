import 'package:book_store_app/core/utils/styles.dart';
import 'package:book_store_app/features/home/data/models/book_model/book_model.dart';
import 'package:book_store_app/features/home/presentation/widgets/books_action.dart';
import 'package:book_store_app/features/home/presentation/widgets/custom_book_details_app_bar.dart';
import 'package:book_store_app/features/home/presentation/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class BookDetailViewBody extends StatelessWidget {
  const BookDetailViewBody({
    super.key,
    required this.bookModel,
  });

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: CustomBookDetailsAppBar(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .4,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: CustomBookImage(
                    imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? '',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  bookModel.volumeInfo.title!,
                  style: Styles.textStyle20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  bookModel.volumeInfo.authors?[0] ?? '',
                  style: Styles.textStyle14,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Text(
                textAlign: TextAlign.center,
                maxLines: 10,
                overflow: TextOverflow.ellipsis,
                bookModel.volumeInfo.description ??
                    'There is no description available for this book',
                style: Styles.textStyle14,
              ),
            ),
            BooksAction(
              bookModel: bookModel,
            )
          ],
        ),
      ],
    );
  }
}
