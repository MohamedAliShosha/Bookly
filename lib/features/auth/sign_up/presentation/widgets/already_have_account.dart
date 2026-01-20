import 'package:book_store_app/constants.dart';
import 'package:book_store_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Already have an account? ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white70,
            fontSize: 14,
            fontFamily: kGtSectraFine,
          ),
        ),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).go(AppRouter.kLoginView);
          },
          child: const Text(
            "Login",
            style: TextStyle(
              color: Colors.blueAccent,
              fontFamily: kGtSectraFine,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        )
      ],
    );
  }
}
