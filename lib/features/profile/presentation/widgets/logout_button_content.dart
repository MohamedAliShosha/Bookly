import 'package:book_store_app/constants.dart';
import 'package:flutter/material.dart';

class LogoutButtonContent extends StatelessWidget {
  const LogoutButtonContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.logout, size: 20),
        SizedBox(width: 8),
        Text(
          'Logout',
          style: TextStyle(
            fontFamily: kGtSectraFine,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
