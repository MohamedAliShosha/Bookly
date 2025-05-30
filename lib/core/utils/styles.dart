import 'package:book_store_app/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class Styles {
  static const textStyle18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600, // SemiBold
    color: ColorsManager.kYellowColor,
  );

  static final textStyle20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal, // Regular
    color: ColorsManager.kYellowColor,
    fontFamily: GoogleFonts.ruslanDisplay().fontFamily,
  );

  static final textStyle14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal, // Regular
    color: ColorsManager.kYellowColor,
    fontFamily: GoogleFonts.ruslanDisplay().fontFamily,
  );

  static const textStyle16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500, // Medium
    color: ColorsManager.kYellowColor,
  );

  static const textStyle30 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.normal, // Regular
    color: ColorsManager.kYellowColor,
  );
}
