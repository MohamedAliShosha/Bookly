import 'package:flutter/material.dart';

class BookStore extends StatelessWidget {
  const BookStore({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(),
    );
  }
}

void main() {
  runApp(
    const BookStore(),
  );
}
