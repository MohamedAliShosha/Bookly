import 'package:book_store_app/core/utils/styles.dart';
import 'package:book_store_app/features/home/data/models/book_model/book_model.dart';
import 'package:book_store_app/features/home/widgets/custom_app_bar.dart';
import 'package:book_store_app/features/home/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.bookModel});

  final BookModel
      bookModel; // 1 The book model that will be passed to the details view

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: CustomAppBar(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CustomBookImage(
                      imageUrl:
                          bookModel.volumeInfo.imageLinks?.thumbnail ?? '',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    bookModel.volumeInfo.title!,
                    style: Styles.textStyle20.copyWith(
                      fontFamily: GoogleFonts.ruslanDisplay().fontFamily,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    bookModel.volumeInfo.authors![0],
                    style: Styles.textStyle14.copyWith(
                      fontFamily: GoogleFonts.ruslanDisplay().fontFamily,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis,
                    bookModel.volumeInfo.description ??
                        'There is no description available for this book',
                    style: Styles.textStyle14.copyWith(
                      fontFamily: GoogleFonts.ruslanDisplay().fontFamily,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
