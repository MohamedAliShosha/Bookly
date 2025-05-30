import 'package:book_store_app/core/utils/app_router.dart';
import 'package:book_store_app/core/utils/assets_data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
            height: 30,
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              GoRouter.of(context).push(AppRouter.kSearchView);
            },
            child: const Icon(
              Icons.search,
              color: Color(0xffFFEEC1),
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
