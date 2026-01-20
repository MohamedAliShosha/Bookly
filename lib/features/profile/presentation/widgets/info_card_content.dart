import 'package:book_store_app/constants.dart';
import 'package:flutter/material.dart';

class InfoCardContent extends StatelessWidget {
  final String title;
  final String value;

  const InfoCardContent({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 13,
            fontFamily: kGtSectraFine,
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 17,
            color: kPrimaryColor,
            fontWeight: FontWeight.w600,
            fontFamily: kGtSectraFine,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
