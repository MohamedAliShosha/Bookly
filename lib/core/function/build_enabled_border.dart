import 'package:flutter/material.dart';

OutlineInputBorder buildEnabledBorder(Color borderColor) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(14),
    borderSide: BorderSide(color: borderColor),
  );
}
