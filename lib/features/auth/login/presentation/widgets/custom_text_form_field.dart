import 'package:book_store_app/core/function/build_enabled_border.dart';
import 'package:book_store_app/core/function/build_focused_border.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String label;
  final IconData icon;
  final bool isPassword;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    super.key,
    required this.label,
    required this.icon,
    this.isPassword = false,
    required this.keyboardType,
    required this.controller,
    this.validator,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  // changing fields are written at State object part.
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      keyboardType: widget.keyboardType,
      obscureText: widget.isPassword ? obscureText : false,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withOpacity(.1),
        labelText: widget.label,
        labelStyle: const TextStyle(
          color: Colors.white,
        ),
        prefixIcon: Icon(
          widget.icon,
          color: Colors.white70,
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Colors.white70,
                ),
              )
            : null,
        enabledBorder: buildEnabledBorder(
          Colors.grey,
        ),
        focusedBorder: buildFocusedBorder(
          Colors.white,
        ),
      ),
    );
  }
}
