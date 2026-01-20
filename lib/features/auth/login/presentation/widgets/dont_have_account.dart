import 'package:book_store_app/constants.dart';
import 'package:book_store_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don’t have an account? ",
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontFamily: kGtSectraFine,
          ),
        ),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).go(AppRouter.kSignUpView);
          },
          child: const Text(
            "Sign up",
            style: TextStyle(
              fontFamily: kGtSectraFine,
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        )
      ],
    );
  }
}
