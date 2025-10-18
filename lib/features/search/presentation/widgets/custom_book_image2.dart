import '../../../home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

class CustomBookImage2 extends StatelessWidget {
  const CustomBookImage2({
    super.key,
    required this.bookModel,
  });

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 120,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.network(
          bookModel.volumeInfo.imageLinks?.thumbnail ?? '',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
