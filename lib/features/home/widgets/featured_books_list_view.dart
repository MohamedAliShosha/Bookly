import 'package:book_store_app/constants.dart';
import 'package:book_store_app/core/utils/app_router.dart';
import 'package:book_store_app/features/home/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(), // Makes a bouncing effects
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: () {
                GoRouter.of(context).push(AppRouter.kDetailsView);
              },
              child: const CustomBookImage(
                imageUrl: kBookImageUrl,
              ),
            ),
          );
        },
      ),
    );
  }
}
