import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBookDetailsAppBar extends StatelessWidget {
  const CustomBookDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(
            Icons.close,
            color: Color(0xffFFEEC1),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.shopping_cart_outlined,
            color: Color(0xffFFEEC1),
          ),
        ),
      ],
    );
  }
}
