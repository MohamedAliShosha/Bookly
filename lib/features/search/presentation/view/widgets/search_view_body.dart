import '../../../../../Core/utils/styles.dart';

import 'custom_search_text_field.dart';
import 'search_result_list_view.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
          child: CustomSearchTextField(),
        ),
        const SizedBox(
          height: 16,
        ),
        const Text(
          ' Search Results',
          style: Styles.textStyle18,
        ),
        const SizedBox(
          height: 16,
        ),
        const Expanded(
          child: SearchResultListView(),
        ),
      ],
    );
  }
}
