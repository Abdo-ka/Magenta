// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTypography {
  static TextTheme get textTheme => TextTheme(
        displayLarge: TextStyle(
          fontSize: 57.sp,
          fontWeight: FontWeight.bold,
          fontFamily: poppinsFamily,
        ),
        displayMedium: TextStyle(
          fontSize: 42.sp,
          fontFamily: poppinsFamily,
        ),
        displaySmall: TextStyle(
          fontSize: 36.sp,
          fontFamily: poppinsFamily,
        ),
        headlineLarge: TextStyle(
          fontSize: 25.sp,
          fontFamily: poppinsFamily,
          fontWeight: FontWeight.w700,
        ),
        headlineMedium: TextStyle(
          fontSize: 22.sp,
          fontFamily: poppinsFamily,
          fontWeight: FontWeight.w700,
        ),
        headlineSmall: TextStyle(
          fontSize: 18.sp,
          fontFamily: poppinsFamily,
        ),
        titleLarge: TextStyle(
          fontSize: 16.sp,
          fontFamily: poppinsFamily,
        ),
        titleMedium: TextStyle(
          fontSize: 14.sp,
          fontFamily: poppinsFamily,
        ),
        titleSmall: TextStyle(
          fontSize: 12.sp,
          fontFamily: poppinsFamily,
        ),
        bodyLarge: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          fontFamily: poppinsFamily,
        ),
        bodyMedium: TextStyle(
          fontSize: 14.sp,
          fontFamily: poppinsFamily,
        ),
        bodySmall: TextStyle(
          fontSize: 12.sp,
          fontFamily: poppinsFamily,
        ),
        labelLarge: TextStyle(
          fontSize: 14.sp,
          fontFamily: poppinsFamily,
        ),
        labelMedium: TextStyle(
          fontSize: 12.sp,
          fontFamily: poppinsFamily,
        ),
        labelSmall: TextStyle(
          fontSize: 10.sp,
          fontFamily: poppinsFamily,
        ),
      );

  static const String ibmxFamily = 'IBMPlexSans';
  static const String poppinsFamily = 'Poppins';
  static const String Praise = 'Praise';
}
