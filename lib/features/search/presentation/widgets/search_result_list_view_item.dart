import 'package:book_store_app/core/utils/styles.dart';
import 'package:book_store_app/features/home/data/models/book_model/book_model.dart';
import 'package:book_store_app/features/search/presentation/widgets/custom_book_image2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchResultListViewItem extends StatelessWidget {
  const SearchResultListViewItem({
    super.key,
    required this.bookModel,
  });

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Row(
          children: [
            CustomBookImage2(
              bookModel: bookModel,
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bookModel.volumeInfo.title ?? 'No Title',
                      style: Styles.textStyle20.copyWith(
                          fontFamily: GoogleFonts.ruslanDisplay().fontFamily),
                      overflow: TextOverflow
                          .ellipsis, // means if text is too long, it will be cut off and replaced with '...'
                      maxLines: 2,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      bookModel.volumeInfo.authors != null &&
                              bookModel.volumeInfo.authors!.isNotEmpty
                          ? bookModel.volumeInfo.authors![0]
                          : 'No Author',
                      style: Styles.textStyle14.copyWith(
                          fontFamily: GoogleFonts.ruslanDisplay().fontFamily),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Flexible(
                      child: Row(
                        children: [
                          Text(
                            'Free',
                            style: Styles.textStyle20.copyWith(
                                fontWeight: FontWeight.bold,
                                fontFamily:
                                    GoogleFonts.ruslanDisplay().fontFamily),
                          ),
                          const Spacer(), // Thanks to the expanded widget that i wrapped the column with it, Now I can use Spacer because there will be an available space between the text and the icon
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
