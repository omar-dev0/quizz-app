import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color _primary = Color(0xFF02369C);
  static final Color _black30 = Colors.black.withOpacity(0.3);
  static final ThemeData light = ThemeData(
    canvasColor: _primary,
    colorScheme: ColorScheme.fromSeed(
      seedColor: _primary,
      primary: _primary,
      onPrimary: Colors.white,
      secondary: _primary.withOpacity(.2),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: _black30,
      selectedItemColor: _primary,
      enableFeedback: false,
      unselectedItemColor: _black30,
      selectedLabelStyle: GoogleFonts.roboto(color: _primary, fontSize: 12.sp),
      unselectedLabelStyle:
      GoogleFonts.roboto(color: _black30, fontSize: 12.sp),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _primary,
        disabledBackgroundColor: _black30,
      ),
    ),
    textTheme:  TextTheme(
      labelLarge: GoogleFonts.inter(
        color: Colors.black,
        fontSize : 20.sp,
      ),
      labelMedium: GoogleFonts.roboto(
        color : Colors.black,
        fontSize : 16.sp
      ),
      bodyLarge: GoogleFonts.roboto(
        color: Colors.white,
        fontSize: 16.sp
      )

    ),
  );
}
