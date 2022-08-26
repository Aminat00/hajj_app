import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HajjAppTheme {
  // 1
  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.righteous(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    headline1: GoogleFonts.righteous(
      fontSize: 28.0,
      fontWeight: FontWeight.w500,
      color: Colors.teal,
    ),
    headline2: GoogleFonts.righteous(
      fontSize: 21.0,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    headline3: GoogleFonts.righteous(
      fontSize: 22.0,
      fontWeight: FontWeight.w500,
      color: Colors.black87,
    ),
    headline5: GoogleFonts.righteous(
      fontSize: 26.0,
      fontWeight: FontWeight.w600,
      color: Colors.teal,
    ),
    headline6: GoogleFonts.righteous(
      fontSize: 22.0,
      fontWeight: FontWeight.w600,
      color: Colors.teal,
    ),
    bodyText2: GoogleFonts.righteous(
      fontSize: 16,
      color: Colors.black45,
      fontWeight: FontWeight.w300,
    ),
    subtitle2: GoogleFonts.righteous(
      fontSize: 16,
      color: Colors.teal,
      fontWeight: FontWeight.w500,
    ),
  );

  // 2
  static TextTheme darkTextTheme = TextTheme(
    bodyText1: GoogleFonts.righteous(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    headline1: GoogleFonts.righteous(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline2: GoogleFonts.righteous(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    headline3: GoogleFonts.righteous(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headline6: GoogleFonts.righteous(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    bodyText2: GoogleFonts.righteous(
      fontSize: 15,
      color: Colors.white,
    ),

  );

  // 3
  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith(
              (states) {
            return Colors.black;
          },
        ),
      ),
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.teal,
      ),
      textTheme: lightTextTheme,
    );
  }

  // 4
  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        foregroundColor: Colors.white,
        backgroundColor: Colors.grey[900],
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.teal,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.teal,
      ),
      textTheme: darkTextTheme,
    );
  }
}