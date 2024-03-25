import 'package:book_store/core/utils/app_colors.dart';
import 'package:book_store/core/utils/app_strings.dart';
import 'package:book_store/core/utils/font_sizes_helper.dart';
import 'package:book_store/core/utils/fontweight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData ligthTheme() {
  return ThemeData(
    primaryColor: AppColors.primaryColor,
    hintColor: AppColors.hintColor,
    brightness: Brightness.light,
    fontFamily: AppStrings.fontFamily,
    appBarTheme:  AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      centerTitle: false,
      titleTextStyle: TextStyle(
        color: AppColors.white,
        fontSize: FontSizeHelper.extraLarge1.sp,
        fontWeight: FontWeightHelper.bold,
      ),
    ),
    textTheme:  TextTheme(
      headlineLarge: TextStyle(
        fontSize: FontSizeHelper.extraLarge2.sp,
        fontWeight: FontWeightHelper.semiBold,
        color: AppColors.white,
      ),
      headlineSmall: const TextStyle(
        fontSize: FontSizeHelper.small,
        fontWeight: FontWeightHelper.regular,
        color: AppColors.white,
      ),
      headlineMedium: const TextStyle(
        fontSize: FontSizeHelper.medium,
        fontWeight: FontWeightHelper.medium,
        color: AppColors.white,
      ),
    ),

   
  );
}
