import 'package:book_store_app/constants.dart';
import 'package:book_store_app/core/utils/styles.dart';
import 'package:book_store_app/features/home/widgets/custom_app_bar.dart';
import 'package:book_store_app/features/home/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: CustomBookImage(
                  imageUrl: kBookImageUrl,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Jungle Book',
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
                'Rudyard Kipling',
                style: Styles.textStyle14.copyWith(
                  fontFamily: GoogleFonts.ruslanDisplay().fontFamily,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                maxLines: 6,
                overflow: TextOverflow.ellipsis,
                'Description: The Jungle Book is a collection of stories by the English author Rudyard Kipling. Most of the characters are animals such as Shere Khan the tiger and Baloo the bear, though a principal character',
                style: Styles.textStyle14.copyWith(
                  fontFamily: GoogleFonts.ruslanDisplay().fontFamily,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
