import 'package:book_store_app/constants.dart';
import 'package:book_store_app/core/utils/styles.dart';
import 'package:book_store_app/features/home/widgets/book_rating.dart';
import 'package:book_store_app/features/home/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewestBookListViewItem extends StatelessWidget {
  const NewestBookListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Row(
        children: [
          const CustomBookImage(
            imageUrl: kBookImageUrl,
          ),
          const SizedBox(
            width: 30,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width *
                      0.5, // 50% of width of screen
                  child: Text(
                    'The Jungle Book',
                    style: Styles.textStyle20.copyWith(
                        fontFamily: GoogleFonts.ruslanDisplay().fontFamily),
                    overflow: TextOverflow
                        .ellipsis, // means if text is too long, it will be cut off and replaced with '...'
                    maxLines: 2,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  'Rudyard Kipling',
                  style: Styles.textStyle14.copyWith(
                      fontFamily: GoogleFonts.ruslanDisplay().fontFamily),
                ),
                const SizedBox(
                  height: 3,
                ),
                Flexible(
                  child: Row(
                    children: [
                      Text(
                        'Free',
                        style: Styles.textStyle20.copyWith(
                            fontWeight: FontWeight.bold,
                            fontFamily: GoogleFonts.ruslanDisplay().fontFamily),
                      ),
                      const Spacer(), // Thanks to the expanded widget that i wrapped the column with it, Now I can use Spacer because there will be an available space between the text and the icon
                      const BookRating(
                        rating: 6,
                        count: 250,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
