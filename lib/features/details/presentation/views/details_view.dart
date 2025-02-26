import 'package:book_store_app/constants.dart';
import 'package:book_store_app/features/home/widgets/custom_app_bar.dart';
import 'package:book_store_app/features/home/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DetailsViewBody(),
    );
  }
}

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: CustomAppBar(),
          ),
          CustomBookImage(
            imageUrl: kBookImageUrl,
          )
        ],
      ),
    );
  }
}
