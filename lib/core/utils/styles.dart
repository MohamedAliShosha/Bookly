import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class Styles {
  static const textStyle18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600, // SemiBold
    color: Color(0xffFFEEC1),
  );

  static final textStyle20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal, // Regular
    color: const Color(0xffFFEEC1),
    fontFamily: GoogleFonts.ruslanDisplay().fontFamily,
  );

  static final textStyle14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal, // Regular
    color: const Color(0xffFFEEC1),
    fontFamily: GoogleFonts.ruslanDisplay().fontFamily,
  );

  static const textStyle16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500, // Medium
    color: Color(0xffFFEEC1),
  );

  static const textStyle30 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.normal, // Regular
    color: Color(0xffFFEEC1),
  );
}
