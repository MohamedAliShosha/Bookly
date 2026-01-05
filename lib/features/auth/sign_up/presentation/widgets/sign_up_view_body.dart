import 'package:book_store_app/Features/auth/sign_up/presentation/widgets/sign_up_bloc_listener.dart';
import 'package:book_store_app/Features/auth/sign_up/presentation/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28, vertical: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.person,
              size: 85,
              color: Colors.white,
            ),
            SizedBox(height: 25),
            Text(
              "Create Account",
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Opacity(
              opacity: .7,
              child: Text(
                "Sign up to get started",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
            SizedBox(height: 35),
            SignUpForm(),
            SignUpBlocListener(),
          ],
        ),
      ),
    );
  }
}
