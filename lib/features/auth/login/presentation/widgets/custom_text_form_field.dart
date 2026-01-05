import 'package:book_store_app/core/function/build_enabled_border.dart';
import 'package:book_store_app/core/function/build_focused_border.dart';
import 'package:flutter/material.dart';

/// Reusable TextField
class AppTextFormField extends StatefulWidget {
  final String labelText;
  final IconData prefixIcon;
  final bool isPassword;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const AppTextFormField({
    super.key,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    required this.controller,
    this.validator,
    required this.labelText,
    required this.prefixIcon,
  });

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  // changing fields are written at State object part.
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validator,
      controller: widget.controller,
      cursorColor: Colors.white70,
      keyboardType: widget.keyboardType,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      obscureText: widget.isPassword
          ? _obscureText
          : false, // Text here is hidden when isPassword is true
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(
          widget.prefixIcon,
          color: Colors.white70,
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Colors.white70,
                ),
              )
            : null,
        labelStyle: const TextStyle(
          color: Colors.white,
        ),
        filled: true,
        fillColor: Colors.white.withOpacity(
          .1,
        ),
        focusedBorder: buildFocusedBorder(
          Colors.white,
        ),
        enabledBorder: buildEnabledBorder(Colors.grey),
        labelText: widget.labelText,
      ),
    );
  }
}
