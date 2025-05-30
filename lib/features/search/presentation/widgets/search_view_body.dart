import 'package:book_store_app/core/utils/colors_manager.dart';
import 'package:book_store_app/features/search/presentation/widgets/custom_search_text_filed.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(right: 10, left: 10, top: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomSearchTextField(),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Search Results',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.kYellowColor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // Expanded(
              //   child: SearchedResultListView(),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
