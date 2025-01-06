import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailStyles {
  static TextStyle get titleStyle => GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get locationStyle => GoogleFonts.poppins(
        fontSize: 14,
        color: Colors.grey,
      );

  static TextStyle get priceStyle => GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      );

  static TextStyle get featureStyle => GoogleFonts.poppins(
        fontSize: 12,
        color: Colors.grey[700],
      );

  static TextStyle get sectionTitleStyle => GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get descriptionStyle => GoogleFonts.poppins(
        fontSize: 14,
        height: 1.5,
        color: Colors.grey[800],
      );

  static TextStyle get agentNameStyle => GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get agencyStyle => GoogleFonts.poppins(
        fontSize: 14,
        color: Colors.grey,
      );
      static TextStyle get statusStyle => GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get buttonStyle => GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get amenityStyle => GoogleFonts.poppins(
        fontSize: 12,
        color: Colors.grey[600],
      );
}
