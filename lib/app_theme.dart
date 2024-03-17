import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class BookyTheme {
  static TextTheme normalTextTheme = TextTheme(

    headlineSmall: GoogleFonts.exo(
        fontSize: 25,
        fontWeight: FontWeight.w400,
        color: Colors.black
    ),
    titleLarge: GoogleFonts.exo(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
        color: Colors.black
    ),
    titleMedium: GoogleFonts.exo(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
        color: Colors.black
    ),
    titleSmall: GoogleFonts.exo(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        color: Colors.black
    ),
    bodyLarge: GoogleFonts.exo(
        fontSize: 17,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        color: Colors.black
    ),
    bodyMedium: GoogleFonts.exo(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: Colors.black
    ),
    labelLarge: GoogleFonts.exo(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.25,
        color: Colors.black
    ),
  );

  static ThemeData normal(){
    return ThemeData(
      fontFamily: GoogleFonts.exo().fontFamily,
      useMaterial3: true,
      textTheme: normalTextTheme,
      colorScheme: ColorScheme.fromSwatch(
        accentColor: const Color(0xFFFF4713),
      ),
      appBarTheme:  AppBarTheme(
        elevation: 2.0,
        surfaceTintColor: const Color(0xFFDCE2EB),
        shadowColor: const Color(0xFF141D29),
        backgroundColor: const Color(0xFFDCE2EB),
        foregroundColor: const Color(0xFF141D29),
        titleTextStyle: normalTextTheme.titleMedium,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xFFDCE2EB),
        selectedItemColor:  Color(0xFFFF4713),
        unselectedItemColor: Color(0xFF58595B),
      ),
      cardTheme: const CardTheme(
        color: Color(0xFFDCE2EB),
      ),
      tabBarTheme: const TabBarTheme(
        dividerColor: Colors.transparent,
        unselectedLabelColor: Color(0xFF58595B),
        indicatorColor: Color(0xFFFF4713),
        labelColor: Color(0xFFFF4713),
      ),
      scaffoldBackgroundColor: const Color(0xFFDCE2EB),

    );
  }
}