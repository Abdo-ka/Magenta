// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTypography {
  static TextTheme get textTheme => TextTheme(
        displayLarge: TextStyle(fontSize: 57.sp, fontWeight: FontWeight.bold),
        displayMedium: TextStyle(fontSize: 42.sp),
        displaySmall: TextStyle(fontSize: 36.sp),
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
        headlineSmall: TextStyle(fontSize: 18.sp),
        titleLarge: TextStyle(fontSize: 16.sp, fontFamily: poppinsFamily),
        titleMedium: TextStyle(fontSize: 14.sp),
        titleSmall: TextStyle(fontSize: 12.sp),
        bodyLarge: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
        bodyMedium: TextStyle(fontSize: 14.sp),
        bodySmall: TextStyle(fontSize: 12.sp),
        labelLarge: TextStyle(fontSize: 14.sp),
        labelMedium: TextStyle(fontSize: 12.sp),
        labelSmall: TextStyle(fontSize: 10.sp),
      );

  static const String ibmxFamily = 'IBMPlexSans';
  static const String poppinsFamily = 'Poppins';
  static const String Praise = 'Praise';
}
