import 'package:flutter/material.dart';

import '../constant/app_color.dart';

ThemeData appTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: AppColor.scaffoldBackGround,
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColor.primary,
    primary: AppColor.primary,
    secondary: AppColor.secondary,
    surface: AppColor.cardColor,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColor.scaffoldBackGround,
    elevation: 0,
    centerTitle: false,
    titleTextStyle: TextStyle(
      color: AppColor.textColor,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
  ),
  textTheme: TextTheme(
    headlineLarge: TextStyle(
      color: AppColor.textColor,
      fontSize: 34,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: TextStyle(
      color: AppColor.textColor,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      color: AppColor.textColor,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: TextStyle(color: AppColor.grey, fontSize: 15, height: 1.4),
  ),
);
