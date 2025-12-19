import 'package:book_store_app/Features/auth/login/presentation/widgets/custom_text_form_field.dart';
import 'package:book_store_app/core/widgets/app_button.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            validator: (data) {
              if (data == null || data.isEmpty) {
                return 'This field is required';
              }
              if (!EmailValidator.validate(data)) {
                return 'Please enter a valid email address';
              }
              return null; // Return null if the input is valid
            },
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            label: "Email",
            icon: Icons.email_outlined,
          ),
          const SizedBox(height: 20),

          // Password Field
          CustomTextFormField(
            validator: (data) {
              if (data == null || data.isEmpty) {
                return 'This field is required';
              } else if (data.length < 6) {
                return "Password must be at least 6 characters";
              }
              return null;
            },
            controller: passwordController,
            keyboardType: TextInputType.visiblePassword,
            label: "Password",
            icon: Icons.lock_outline,
            isPassword: true,
          ),
          const SizedBox(height: 40),
          // Login Button
          AppButton(
            title: "Login",
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
