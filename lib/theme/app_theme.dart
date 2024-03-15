import 'package:flutter/material.dart';
import 'package:prototyping/theme/app_colors.dart';

final lightTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: AppColors.colorBgF5F5F5,
  highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.colorBgF5F5F5,
  ),
);
