import 'package:book_store_app/core/utils/styles.dart';
import 'package:book_store_app/features/search/presentation/widgets/custom_book_image2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return SizedBox(
          height: 150,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            child: Row(
              children: [
                const CustomBookImage2(),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'title',
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
                        'Author',
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
              ],
            ),
          ),
        );
      },
    );
  }
}
