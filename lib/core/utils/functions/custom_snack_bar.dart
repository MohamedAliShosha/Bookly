import 'package:flutter/material.dart';

void customSnackBar(context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.white,
      content: Text(
        textAlign: TextAlign.center,
        text,
        style: const TextStyle(color: Colors.black),
      ),
    ),
  );
}
