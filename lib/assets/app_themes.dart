import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tostinh/assets/app_colors.dart';
import 'package:tostinh/assets/app_constants.dart';

class AppThemes {
  static ThemeData darkTheme = ThemeData(
    fontFamily: "Metropolis",
    scaffoldBackgroundColor: AppColors.white,
    primaryColor: AppColors.white,
    splashColor: AppColors.pink.withOpacity(0.30),
    textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.pink,
        selectionColor: AppColors.yellow,
        selectionHandleColor: AppColors.pink),
    textTheme: const TextTheme().copyWith(
      headlineLarge: const TextStyle().copyWith(
          color: Colors.black, fontWeight: FontWeight.w700, fontSize: 34.sp),
      headlineMedium: const TextStyle().copyWith(
        color: AppColors.black,
        fontWeight: FontWeight.w600,
        fontSize: 24.sp,
      ),
      headlineSmall: const TextStyle().copyWith(
        color: AppColors.black,
        fontWeight: FontWeight.w600,
        fontSize: 18.sp,
      ),
      titleLarge: const TextStyle().copyWith(
        color: AppColors.black,
        fontWeight: FontWeight.w600,
        fontSize: 16.sp,
      ),
      titleMedium: const TextStyle().copyWith(
        color: AppColors.black,
        fontWeight: FontWeight.w400,
        fontSize: 14.sp,
      ),
      titleSmall: const TextStyle().copyWith(
        color: AppColors.black,
        fontWeight: FontWeight.w400,
        fontSize: 12.sp,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      brightness: Brightness.light,
      background: AppColors.white,
      primary: AppColors.white,
      primaryContainer: AppColors.whiteGray,
      secondary: AppColors.black,
      secondaryContainer: AppColors.blackGray,
      surface: AppColors.white,
      inverseSurface: AppColors.black,
      surfaceVariant: AppColors.whiteGray,
      onPrimary: AppColors.black,
      onPrimaryContainer: AppColors.blackGray,
      onSecondary: AppColors.white,
      onSecondaryContainer: AppColors.whiteGray,
      onSurface: AppColors.black,
      onInverseSurface: AppColors.white,
      onSurfaceVariant: AppColors.blackGray,
    ),
  );

  static ThemeData lightTheme = ThemeData(
    fontFamily: "Metropolis",
    scaffoldBackgroundColor: AppColors.white,
    primaryColor: AppColors.white,
    splashColor: AppColors.pink.withOpacity(0.30),
    textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.pink,
        selectionColor: AppColors.yellow,
        selectionHandleColor: AppColors.pink),
    textTheme: const TextTheme().copyWith(
      headlineLarge: const TextStyle().copyWith(
          color: Colors.black, fontWeight: FontWeight.w700, fontSize: 34.sp),
      headlineMedium: const TextStyle().copyWith(
        color: AppColors.black,
        fontWeight: FontWeight.w600,
        fontSize: 24.sp,
      ),
      headlineSmall: const TextStyle().copyWith(
        color: AppColors.black,
        fontWeight: FontWeight.w600,
        fontSize: 18.sp,
      ),
      titleLarge: const TextStyle().copyWith(
        color: AppColors.black,
        fontWeight: FontWeight.w600,
        fontSize: 16.sp,
      ),
      titleMedium: const TextStyle().copyWith(
        color: AppColors.black,
        fontWeight: FontWeight.w400,
        fontSize: 14.sp,
      ),
      titleSmall: const TextStyle().copyWith(
        color: AppColors.black,
        fontWeight: FontWeight.w400,
        fontSize: 12.sp,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      brightness: Brightness.light,
      background: AppColors.white,
      primary: AppColors.white,
      primaryContainer: AppColors.whiteGray,
      secondary: AppColors.black,
      secondaryContainer: AppColors.blackGray,
      surface: AppColors.white,
      inverseSurface: AppColors.black,
      surfaceVariant: AppColors.whiteGray,
      onPrimary: AppColors.black,
      onPrimaryContainer: AppColors.blackGray,
      onSecondary: AppColors.white,
      onSecondaryContainer: AppColors.whiteGray,
      onSurface: AppColors.black,
      onInverseSurface: AppColors.white,
      onSurfaceVariant: AppColors.blackGray,
    ),
  );

  static ThemeMode themeMode() {
    final isDarkMode = GetStorage().read(AppConstants.keyThemeMode);
    if (isDarkMode != null) {
      if (isDarkMode) {
        return ThemeMode.dark;
      } else {
        return ThemeMode.light;
      }
    } else {
      return ThemeMode.light;
    }
  }
}
