import 'package:book_store_app/constants.dart';
import 'package:flutter/material.dart';

SnackBar buildErrorSnackBar(String errorMessage) {
  return SnackBar(
    backgroundColor: kPrimaryColor,
    content: Text(
      errorMessage,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
