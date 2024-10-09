import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz_app/core/resources/colors.dart';

class AppTheme {

  static final ThemeData light = ThemeData(
    canvasColor: AppColors.primary,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      primary: AppColors.primary,
      onPrimary: Colors.white,
      secondary: AppColors.primary.withOpacity(.2),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.black30,
      selectedItemColor: AppColors.primary,
      enableFeedback: false,
      unselectedItemColor: AppColors.primary,
      selectedLabelStyle: GoogleFonts.roboto(color: AppColors.primary, fontSize: 12.sp),
      unselectedLabelStyle:
      GoogleFonts.roboto(color: AppColors.black30, fontSize: 12.sp),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 14.h),
        backgroundColor: AppColors.primary,
        disabledBackgroundColor: AppColors.black30,
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
        color: Colors.black,
        fontSize: 16.sp
      ),
    ),
    inputDecorationTheme:  InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.grey , width: 1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(4.r) ,
          topRight: Radius.circular(4.r) ,
        )
      ),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.grey , width: 1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4.r) ,
            topRight: Radius.circular(4.r) ,
          )
      ),
      disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.grey , width: 1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4.r) ,
            topRight: Radius.circular(4.r) ,
          )
      ),
      border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.error , width: 1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4.r) ,
            topRight: Radius.circular(4.r) ,
          )
      ),
      errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.error , width: 1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4.r) ,
            topRight: Radius.circular(4.r) ,
          )
      ),
      errorStyle: GoogleFonts.roboto(fontSize : 12.sp , color : AppColors.error),
      labelStyle: GoogleFonts.roboto(fontSize : 14.sp , color : AppColors.grey),
    ),
  );
}
