import 'package:book_store_app/Features/auth/login/data/models/login_request_body.dart';
import 'package:book_store_app/Features/auth/login/presentation/manager/login/login_cubit.dart';
import 'package:book_store_app/Features/auth/login/presentation/widgets/custom_text_form_field.dart';
import 'package:book_store_app/Features/auth/login/presentation/widgets/dont_have_account.dart';
import 'package:book_store_app/core/widgets/app_button.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            // label: "Email",
            // icon: Icons.email_outlined,
          ),
          const SizedBox(height: 20),

          // Password Field
          AppTextFormField(
            prefixIcon: Icons.lock,
            labelText: 'Password',
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
            // label: "Password",
            // icon: Icons.lock_outline,
            isPassword: true,
          ),
          const SizedBox(height: 40),
          // Login Button
          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return AppButton(
                isLoading: state is LoginLoading,
                title: "Login",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<LoginCubit>().login(
                          LoginRequestBody(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          ),
                        );
                  }
                },
              );
            },
          ),
          const SizedBox(height: 25),
          const DontHaveAccount(),
        ],
      ),
    );
  }
}
