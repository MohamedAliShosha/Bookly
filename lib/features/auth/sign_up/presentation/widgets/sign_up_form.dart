import 'package:book_store_app/Features/auth/login/presentation/widgets/custom_text_form_field.dart';

import '../../../../../core/widgets/app_button.dart';
import 'already_have_account.dart';

import '../../data/models/sign_up_request_body.dart';
import '../manager/sign_up/sign_up_cubit.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          AppTextFormField(
            prefixIcon: Icons.person,
            labelText: "Name",
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
          AppTextFormField(
            prefixIcon: Icons.email_outlined,
            labelText: "Email",
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
          AppTextFormField(
            prefixIcon: Icons.phone,
            labelText: 'Phone',
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
          AppTextFormField(
            prefixIcon: Icons.lock,
            labelText: 'Password',
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
          AppTextFormField(
            prefixIcon: Icons.lock,
            labelText: "Password Confirmation",
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
          const SizedBox(height: 50),
          // Sign Up Button
          BlocBuilder<SignUpCubit, SignUpState>(
            builder: (context, state) {
              return AppButton(
                title: 'Sign Up',
                isLoading: state is SignUpLoading,
                onPressed: () async {
                  // Handle sign up logic
                  if (_formKey.currentState!.validate()) {
                    await context.read<SignUpCubit>().signUp(
                          SignUpRequestBody(
                            name: nameController.text.trim(),
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                            confirmPassword:
                                passwordConfirmationController.text.trim(),
                            phone: phoneController.text.trim(),
                            gender: 0,
                          ),
                        );
                  }
                },
              );
            },
          ),
          const SizedBox(height: 30),
          const AlreadyHaveAccount(),
          // Confirm Password
        ],
      ),
    );
  }
}
