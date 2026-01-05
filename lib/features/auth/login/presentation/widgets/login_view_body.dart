import 'package:book_store_app/Features/auth/login/presentation/widgets/login_bloc_listener.dart';
import 'package:book_store_app/Features/auth/login/presentation/widgets/login_form.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28, vertical: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.lock_outline,
              size: 85,
              color: Colors.white,
            ),
            SizedBox(height: 25),
            // Welcome Text
            Text(
              "Welcome Back",
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            // Creates a widget that makes its child partially transparent.
            Opacity(
              opacity: .7,
              child: Text(
                "Please sign in to continue",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 40),
            LoginForm(),
            LoginBlocListener()
          ],
        ),
      ),
    );
  }
}
