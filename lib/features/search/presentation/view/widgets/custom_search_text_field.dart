import '../../search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSearchTextField extends StatelessWidget {
  CustomSearchTextField({super.key});
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
          onTap: () {
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
          child: const Icon(Icons.search, color: Colors.white),
        ),
        enabledBorder: buildOutlLinedInputBorder(),
        focusedBorder: buildOutlLinedInputBorder(),
        hintText: 'Search for books by Category',
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlLinedInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.white,
      ),
      borderRadius: BorderRadius.circular(12),
    );
  }
}
