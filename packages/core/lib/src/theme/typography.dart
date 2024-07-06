part of "app_theme.dart";

const _package = 'design';

   TextTheme get textTheme => TextTheme(
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

   const String ibmxFamily = 'IBMPlexSans';
   const String poppinsFamily = 'Poppins';
   const String Praise = 'Praise';

//?  Design text styles
extension TextThemeExtension on TextTheme {
  TextStyle get sumImageText => TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.normal,
      fontSize: 16.sp,
      height: 17.fromFigmaHeight(16));

  TextStyle get paragraphMedium => TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.normal,
      fontSize: 14.sp,
      height: 20.fromFigmaHeight(14));

  TextStyle get buttonText => TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
        fontSize: 14.sp,
        height: 20.fromFigmaHeight(14),
      );

  TextStyle get regularText => TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
        letterSpacing: -0.5.w,
        fontSize: 14.sp,
        height: 18.fromFigmaHeight(14),
      );

  TextStyle get listTitle => TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        fontSize: 16.sp,
        letterSpacing: -0.5.w,
        height: 16.fromFigmaHeight(16),
      );

  TextStyle get informerText => TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
        fontSize: 12.sp,
        letterSpacing: -0.5.w,
        height: 16.fromFigmaHeight(12),
      );

  TextStyle get ratingText => TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        fontSize: 14.sp,
        letterSpacing: -0.5.w,
        height: 18.9.fromFigmaHeight(14),
      );

  TextStyle get ratingNumber => TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
        fontSize: 10.sp,
        letterSpacing: -0.5.w,
        height: 13.5.fromFigmaHeight(10),
      );

  ///            <<< NEW TEXT STYLE >>
  /// this text is need to set weight[]  from [FamilyUtils] extension
  TextStyle get display => TextStyle(
        fontFamily: 'Poppins',
        fontSize: 32.sp,
        letterSpacing: -0.16.w,
        height: 40.fromFigmaHeight(32),
      );

  TextStyle get heading => TextStyle(
        fontFamily: 'Poppins',
        fontSize: 24.sp,
        letterSpacing: -0.16.w,
        height: 32.fromFigmaHeight(24),
      );

  TextStyle get label => TextStyle(
        fontFamily: 'Poppins',
        fontSize: 18.sp,
        letterSpacing: -0.16.w,
        height: 24.fromFigmaHeight(18),
      );

  TextStyle get body => TextStyle(
        fontFamily: 'Poppins',
        fontSize: 16.sp,
        letterSpacing: -0.16.w,
        height: 24.fromFigmaHeight(16),
      );

  TextStyle get paragraph => TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14.sp,
        letterSpacing: -0.16.w,
        height: 20.fromFigmaHeight(14),
      );

  TextStyle get footnote => TextStyle(
        fontFamily: 'Poppins',
        fontSize: 12.sp,
        letterSpacing: -0.16.w,
        height: 16.fromFigmaHeight(12),
      );

  TextStyle get xs => TextStyle(
        fontFamily: 'Poppins',
        fontSize: 12.sp,
        height: 18.fromFigmaHeight(12),
      );
}

extension FamilyUtils on TextStyle {
  TextStyle get extraBold => copyWith(fontWeight: FontWeight.w800);

  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);

  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);

  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);

  TextStyle get regular => copyWith(fontWeight: FontWeight.w400);

  TextStyle get light => copyWith(fontWeight: FontWeight.w300);
}

class HelperFont {
  static FontWeight? w440 = FontWeight.lerp(FontWeight.w400, FontWeight.w500, 0.4);

  static FontWeight? w430 = FontWeight.lerp(FontWeight.w400, FontWeight.w500, 0.3);

  static FontWeight? w460 = FontWeight.lerp(FontWeight.w400, FontWeight.w500, 0.6);

  static FontWeight? w428 = FontWeight.lerp(FontWeight.w400, FontWeight.w500, 0.28);

  static FontWeight? w472 = FontWeight.lerp(FontWeight.w400, FontWeight.w500, 0.72);

  static FontWeight? w536 = FontWeight.lerp(FontWeight.w500, FontWeight.w600, 0.36);
}
