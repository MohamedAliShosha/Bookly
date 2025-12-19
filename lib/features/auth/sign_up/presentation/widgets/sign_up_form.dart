import 'package:book_store_app/Features/auth/login/presentation/widgets/custom_text_form_field.dart';
import 'package:book_store_app/core/widgets/app_button.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordConfirmationController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Full Name
          CustomTextFormField(
            icon: Icons.person_outline,
            label: 'Name',
            keyboardType: TextInputType.name,
            validator: (data) {
              if (data == null || data.isEmpty) {
                return 'This field is required';
              }
              return null; // Return null if the input is valid
            },
            controller: nameController,
            isPassword: false,
          ),
          const SizedBox(height: 15),
          CustomTextFormField(
            icon: Icons.email_outlined,
            label: 'Email',
            validator: (data) {
              if (data == null || data.isEmpty) {
                return 'This field is required';
              }
              if (!EmailValidator.validate(data)) {
                return 'Please enter a valid email address';
              }
              return null; // Return null if the input is valid
            },
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
            isPassword: false,
          ),
          const SizedBox(height: 15),
          // Email
          CustomTextFormField(
            icon: Icons.phone_outlined,
            label: 'Phone',
            keyboardType: TextInputType.phone,
            validator: (data) {
              if (data == null || data.isEmpty) {
                return 'This field is required';
              }
              return null; // Return null if the input is valid
            },
            controller: phoneController,
            isPassword: false,
          ),
          const SizedBox(height: 15),
          // Password
          CustomTextFormField(
            icon: Icons.lock_outline,
            label: 'Password',
            keyboardType: TextInputType.visiblePassword,
            validator: (data) {
              if (data == null || data.isEmpty) {
                return 'This field is required';
              } else if (data.length < 6) {
                return "Password must be at least 6 characters";
              }
              return null; // Return null if the input is valid
            },
            controller: passwordController,
            isPassword: true,
          ),
          const SizedBox(height: 15),

          // Confirm Password
          CustomTextFormField(
            icon: Icons.lock_outline,
            label: 'Confirm Password',
            keyboardType: TextInputType.visiblePassword,
            validator: (data) {
              if (data == null || data.isEmpty) {
                return 'This field is required';
              } else if (data.length < 8) {
                return "Password must be at least 8 characters";
              } else if (data != passwordController.text) {
                return "Passwords don't match";
              }
              return null; // Return null if the input is valid
            },
            controller: passwordConfirmationController,
            isPassword: true,
          ),
          const SizedBox(height: 30),
          AppButton(
            title: 'Create Account',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
