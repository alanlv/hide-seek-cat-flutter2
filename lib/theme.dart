import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hide_seek_cat_flutter2/common/values/values.dart';
/**
 * 深色主题适配
 * @author yinlei
*/
ThemeData ylLightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.secondaryColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
    ),
    iconTheme: IconThemeData(
      color: AppColors.primaryColor,
    ),
    textTheme: GoogleFonts.maShanZhengTextTheme().copyWith(
      bodyText2: TextStyle(color: AppColors.textColor),
      headline1: TextStyle(color: AppColors.textColor),
      headline2: TextStyle(color: AppColors.textColor),
      headline3: TextStyle(color: AppColors.textColor),
      headline4: TextStyle(color: AppColors.textColor),
      headline5: TextStyle(color: AppColors.textColor),
      headline6: TextStyle(color: AppColors.textColor),
    ),
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
      error: AppColors.redColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.secondaryColor,
      selectedItemColor: AppColors.primaryColor.withOpacity(0.7),
      unselectedItemColor: AppColors.primaryColor.withOpacity(0.32),
      selectedIconTheme: IconThemeData(color: AppColors.primaryColor),
      showUnselectedLabels: true,
    ),
  );
}

ThemeData ylDarkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    primaryColor: AppColors.primaryDarkColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
    ),
    iconTheme: IconThemeData(
      color: AppColors.primaryDarkColor,
    ),
    textTheme: GoogleFonts.maShanZhengTextTheme().copyWith(
      bodyText2: TextStyle(color: AppColors.textDarkColor),
      headline1: TextStyle(color: AppColors.secondaryDarkColor),
      headline2: TextStyle(color: AppColors.secondaryDarkColor),
      headline3: TextStyle(color: AppColors.secondaryDarkColor),
      headline4: TextStyle(color: AppColors.secondaryDarkColor),
      headline5: TextStyle(color: AppColors.secondaryDarkColor),
      headline6: TextStyle(color: AppColors.secondaryDarkColor),
    ),
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryDarkColor,
      secondary: AppColors.secondaryDarkColor,
      error: AppColors.redColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.primaryDarkColor.withOpacity(0.7),
      unselectedItemColor: AppColors.primaryDarkColor.withOpacity(0.32),
      selectedIconTheme: IconThemeData(color: AppColors.primaryDarkColor),
      showUnselectedLabels: true,
    ),
  );
}