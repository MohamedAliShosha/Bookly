import 'package:book_store_app/features/home/widgets/newest_book_list_view_item.dart';
import 'package:flutter/material.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(), // disable scrolling
      padding: EdgeInsets.zero, // remove padding of ListView
      itemCount: 10,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: NewestBookListViewItem(),
        );
      },
    );
  }
}
