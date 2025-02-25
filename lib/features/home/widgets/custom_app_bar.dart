import 'package:book_store_app/core/utils/assets_data.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, bottom: 20),
      child: Row(
        children: [
          Image.asset(
            AssetsData.frame,
            height: 18,
          ),
          const Spacer(),
          const Icon(
            Icons.card_travel,
          ),
        ],
      ),
    );
  }
}
