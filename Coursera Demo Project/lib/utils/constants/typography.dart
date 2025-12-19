
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts{
  static TextStyle headline = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static TextStyle subHeading = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600
  );

  static TextStyle bodyText = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: 14
  );

  static TextStyle buttonText = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w500
  );
}