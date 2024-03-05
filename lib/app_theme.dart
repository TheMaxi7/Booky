import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class BookyTheme {
  static TextTheme normalTextTheme = TextTheme(
      headlineSmall: GoogleFonts.exo(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: const Color(0xFF141D29)
      ),
      headlineMedium: GoogleFonts.exo(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: const Color(0xFF141D29)
      ),
      bodyMedium: GoogleFonts.exo(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: const Color(0xFF58595B)
      ),
      bodySmall: GoogleFonts.exo(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: const Color(0xFF141D29)
  )
  );

  static ThemeData normal(){
    return ThemeData(
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
        unselectedLabelColor: Color(0xFF58595B),
        indicatorColor: Color(0xFFFF4713),
        labelColor: Color(0xFFFF4713),
      ),
      scaffoldBackgroundColor: const Color(0xFFDCE2EB),

    );
  }
}