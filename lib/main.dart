import 'package:book_store_app/constants.dart';
import 'package:flutter/material.dart';

class BookStore extends StatelessWidget {
  const BookStore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: kPrimaryColor,
      ),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(),
    );
  }
}

void main() {
  runApp(
    const BookStore(),
  );
}
