import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeStyles {
  static TextStyle get titleStyle => GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get propertyTitleStyle => GoogleFonts.poppins(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      );

  static TextStyle get priceStyle => GoogleFonts.poppins(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: Colors.blue,
      );

  static TextStyle get locationStyle => GoogleFonts.poppins(
        color: Colors.grey,
        fontSize: 14,
      );

  static BorderRadius get cardBorderRadius => BorderRadius.circular(15);
}
