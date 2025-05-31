import 'package:book_store_app/core/utils/colors_manager.dart';
import 'package:book_store_app/features/search/presentation/manager/SearchBookCubit/search_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          onPressed: () {
            final value = _searchController.text;
            if (value.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Please enter a valid search term'),
                ),
              );
            }
            context.read<SearchCubit>().fetchSearchBooks(category: value);
            _searchController.clear();
          },
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
