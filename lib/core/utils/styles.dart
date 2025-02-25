import 'package:book_store_app/constants.dart';
import 'package:flutter/material.dart';

abstract class Styles {
  static const txtStyle18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600, // SemiBold
  );

  static const txtStyle20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal, // Regular
    // fontFamily: kGtSectraFine, // Exeptional font family will be used here only
  );

  static const txtStyle14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal, // Regular
  );

  static const txtStyle16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500, // Medium
    color: kSecondaryColor,
  );

  static const txtStyle30 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.normal, // Regular
  );
}
