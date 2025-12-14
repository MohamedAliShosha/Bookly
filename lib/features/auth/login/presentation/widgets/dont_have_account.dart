import 'package:flutter/material.dart';

class DonHaveAccount extends StatelessWidget {
  const DonHaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don’t have an account?",
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            "Sign up",
            style: TextStyle(
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
