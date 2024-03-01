import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/colors.dart';

/// Custom Class for Light & Dark Text Themes
class ZTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
        fontSize: 32.0.sp, fontWeight: FontWeight.bold, color: ZColors.dark),
    headlineMedium: const TextStyle().copyWith(
        fontSize: 24.0.sp, fontWeight: FontWeight.w600, color: ZColors.dark),
    headlineSmall: const TextStyle().copyWith(
        fontSize: 18.0.sp, fontWeight: FontWeight.w600, color: ZColors.dark),
    titleLarge: const TextStyle().copyWith(
        fontSize: 16.0.sp, fontWeight: FontWeight.w600, color: ZColors.dark),
    titleMedium: const TextStyle().copyWith(
        fontSize: 16.0.sp, fontWeight: FontWeight.w500, color: ZColors.dark),
    titleSmall: const TextStyle().copyWith(
        fontSize: 16.0.sp, fontWeight: FontWeight.w400, color: ZColors.dark),
    bodyLarge: const TextStyle().copyWith(
        fontSize: 14.0.sp, fontWeight: FontWeight.w500, color: ZColors.dark),
    bodyMedium: const TextStyle().copyWith(
        fontSize: 14.0.sp, fontWeight: FontWeight.normal, color: ZColors.dark),
    bodySmall: const TextStyle().copyWith(
        fontSize: 14.0.sp,
        fontWeight: FontWeight.w500,
        color: ZColors.dark.withOpacity(0.5)),
    labelLarge: const TextStyle().copyWith(
        fontSize: 12.0.sp, fontWeight: FontWeight.normal, color: ZColors.dark),
    labelMedium: const TextStyle().copyWith(
        fontSize: 12.0.sp,
        fontWeight: FontWeight.normal,
        color: ZColors.dark.withOpacity(0.5)),
  );

  /// Customizable Dark Text Theme
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
        fontSize: 32.0.sp, fontWeight: FontWeight.bold, color: ZColors.light),
    headlineMedium: const TextStyle().copyWith(
        fontSize: 24.0.sp, fontWeight: FontWeight.w600, color: ZColors.light),
    headlineSmall: const TextStyle().copyWith(
        fontSize: 18.0.sp, fontWeight: FontWeight.w600, color: ZColors.light),
    titleLarge: const TextStyle().copyWith(
        fontSize: 16.0.sp, fontWeight: FontWeight.w600, color: ZColors.light),
    titleMedium: const TextStyle().copyWith(
        fontSize: 16.0.sp, fontWeight: FontWeight.w500, color: ZColors.light),
    titleSmall: const TextStyle().copyWith(
        fontSize: 16.0.sp, fontWeight: FontWeight.w400, color: ZColors.light),
    bodyLarge: const TextStyle().copyWith(
        fontSize: 14.0.sp, fontWeight: FontWeight.w500, color: ZColors.light),
    bodyMedium: const TextStyle().copyWith(
        fontSize: 14.0.sp, fontWeight: FontWeight.normal, color: ZColors.light),
    bodySmall: const TextStyle().copyWith(
        fontSize: 14.0.sp,
        fontWeight: FontWeight.w500,
        color: ZColors.light.withOpacity(0.5)),
    labelLarge: const TextStyle().copyWith(
        fontSize: 12.0.sp, fontWeight: FontWeight.normal, color: ZColors.light),
    labelMedium: const TextStyle().copyWith(
        fontSize: 12.0.sp,
        fontWeight: FontWeight.normal,
        color: ZColors.light.withOpacity(0.5)),
  );
}
