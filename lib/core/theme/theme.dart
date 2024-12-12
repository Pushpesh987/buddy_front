import 'package:flutter/material.dart';
import 'app_pallete.dart';

class AppTheme {
  static OutlineInputBorder _border(Color color) => OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      );

  static const TextStyle displayLargeStyle =
      TextStyle(fontSize: 57, fontWeight: FontWeight.bold, fontFamily: 'Poppins');
  static const TextStyle displayMediumStyle =
      TextStyle(fontSize: 45, fontWeight: FontWeight.bold, fontFamily: 'Poppins');
  static const TextStyle displaySmallStyle =
      TextStyle(fontSize: 35, fontWeight: FontWeight.bold, fontFamily: 'Poppins');
  static const TextStyle headlineLargeStyle =
      TextStyle(fontSize: 32, fontWeight: FontWeight.w600, fontFamily: 'Poppins');
  static const TextStyle headlineMediumStyle =
      TextStyle(fontSize: 28, fontWeight: FontWeight.w600, fontFamily: 'Poppins');
  static const TextStyle headlineSmallStyle =
      TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'Poppins');
  static const TextStyle headlineSmallStyle1 =
      TextStyle(fontSize: 24, fontWeight: FontWeight.w500, fontFamily: 'Poppins');
  static const TextStyle titleLargeStyle = TextStyle(fontSize: 22, fontWeight: FontWeight.w500, fontFamily: 'Poppins');
  static const TextStyle titleMediumStyle =
      TextStyle(fontSize: 20, fontWeight: FontWeight.w500, fontFamily: 'Poppins');
  static const TextStyle titleSmallStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.w500, fontFamily: 'Poppins');
  static const TextStyle bodyLargeStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w500, fontFamily: 'Poppins');
  static const TextStyle bodyMediumStyle =
      TextStyle(fontSize: 14, fontWeight: FontWeight.normal, fontFamily: 'Poppins');
  static const TextStyle bodySmallStyle =
      TextStyle(fontSize: 12, fontWeight: FontWeight.normal, fontFamily: 'Poppins');
  static const TextStyle labelLargeStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w500, fontFamily: 'Poppins');
  static const TextStyle labelMediumStyle =
      TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'Poppins');
  static const TextStyle labelSmallStyle = TextStyle(fontSize: 12, fontWeight: FontWeight.bold, fontFamily: 'Poppins');

  static TextStyle selectedLabelStyle = TextStyle(
    fontWeight: FontWeight.w500,
    color: AppPalette.blackSelectedItemColor,
  ).merge(labelLargeStyle);

  static TextStyle unSelectedLabelStyle = TextStyle(
    fontWeight: FontWeight.normal,
    color: AppPalette.greyUnselectedItemColor,
  ).merge(labelLargeStyle);

  static final ThemeData lightThemeMode = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppPalette.whiteColor,
    primaryColor: AppPalette.yellowColor,
    colorScheme: ColorScheme.light(
      primary: AppPalette.yellowColor,
      secondary: Colors.blue,
      surface: AppPalette.whiteColor,
      error: AppPalette.redColor,
      onPrimary: AppPalette.whiteColor,
      onSecondary: AppPalette.blackColor,
      onSurface: AppPalette.darkSurfaceColor.withOpacity(0.80),
      onError: AppPalette.whiteColor,
    ),
    textTheme: TextTheme(
      displayLarge: displayLargeStyle.copyWith(color: AppPalette.blackColor),
      displayMedium: displayMediumStyle.copyWith(color: AppPalette.blackColor),
      displaySmall: displaySmallStyle.copyWith(color: AppPalette.blackColor),
      headlineLarge: headlineLargeStyle.copyWith(color: AppPalette.blackColor),
      headlineMedium: headlineMediumStyle.copyWith(color: AppPalette.blackColor),
      headlineSmall: headlineSmallStyle.copyWith(color: AppPalette.darkSurfaceColor.withOpacity(0.80)),
      titleLarge: titleLargeStyle.copyWith(color: AppPalette.blackColor),
      titleMedium: titleMediumStyle.copyWith(color: AppPalette.blackColor),
      titleSmall: titleSmallStyle.copyWith(color: AppPalette.blackColor),
      bodyLarge: bodyLargeStyle.copyWith(color: AppPalette.blackColor),
      bodyMedium: bodyMediumStyle.copyWith(color: AppPalette.greyUnselectedItemColor),
      bodySmall: bodySmallStyle.copyWith(color: AppPalette.greyUnselectedItemColor),
      labelLarge: labelLargeStyle.copyWith(color: AppPalette.blueLabelColor),
      labelMedium: labelMediumStyle.copyWith(color: AppPalette.blueLabelColor),
      labelSmall: labelSmallStyle.copyWith(color: AppPalette.blueLabelColor),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(20),
      enabledBorder: _border(AppPalette.blackColor),
      focusedBorder: _border(AppPalette.yellowColor),
      errorBorder: _border(AppPalette.redColor),
      focusedErrorBorder: _border(AppPalette.redColor),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppPalette.whiteColor,
      elevation: 8,
      selectedItemColor: AppPalette.blackSelectedItemColor,
      selectedLabelStyle: selectedLabelStyle,
      unselectedLabelStyle: unSelectedLabelStyle,
      unselectedItemColor: AppPalette.greyUnselectedItemColor,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
    ),
  );
}
