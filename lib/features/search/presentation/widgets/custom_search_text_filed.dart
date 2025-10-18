import '../../../../core/utils/colors_manager.dart';
import '../manager/SearchBookCubit/search_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSearchTextField extends StatelessWidget {
  CustomSearchTextField({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(
        color: ColorsManager.kSecondaryColor,
      ),
      controller: _searchController,
      cursorColor: ColorsManager.kSecondaryColor,
      decoration: InputDecoration(
        hintText: 'Search Books by Category',
        hintStyle: TextStyle(
          color: ColorsManager.kSecondaryColor.withOpacity(0.5),
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
            color: ColorsManager.kSecondaryColor,
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
        color: ColorsManager.kSecondaryColor,
      ),
    );
  }

  OutlineInputBorder focusedBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide(
        color: ColorsManager.kSecondaryColor,
      ),
    );
  }
}
