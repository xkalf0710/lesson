import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const colorPrimary = Color(0xFF01BEC0);
const colorSecondary = Color(0xFF122F53);
const colorTertiary = Color(0xFFFFCF00);
const colorGray1 = Color(0xFF989899);
const colorBackground = Color(0xFFF4F4F4);

ThemeData ligthTheme = ThemeData(
  scaffoldBackgroundColor: const Color(0xFFF3F3F4),
  backgroundColor: const Color(0xFFF3F3F4),
  fontFamily: GoogleFonts.inter().fontFamily,
  textTheme: const TextTheme(
    headline6: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: colorSecondary,
    ),
  ),
);
