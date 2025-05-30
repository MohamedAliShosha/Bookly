import 'package:book_store_app/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';

class CustomSearchTextField extends StatelessWidget {
  CustomSearchTextField({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(
        color: ColorsManager.kYellowColor,
      ),
      controller: _searchController,
      cursorColor: ColorsManager.kYellowColor,
      decoration: InputDecoration(
        hintText: 'Search Books by Category',
        hintStyle: TextStyle(
          color: ColorsManager.kYellowColor.withOpacity(0.5),
        ),
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search,
            color: ColorsManager.kYellowColor,
          ),
        ),
        focusedBorder: focusedBorder(),
        enabledBorder: enabledBorder(),
      ),
    );
  }

  OutlineInputBorder enabledBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide(
        color: ColorsManager.kYellowColor,
      ),
    );
  }

  OutlineInputBorder focusedBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide(
        color: ColorsManager.kYellowColor,
      ),
    );
  }
}
