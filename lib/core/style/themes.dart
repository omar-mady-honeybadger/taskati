import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taskati/core/style/app_colors.dart';
import 'package:taskati/core/style/text_styles.dart';

abstract class AppThemes {
  static ThemeData get lightTheme => ThemeData(
    fontFamily: 'LexendDeca',
    scaffoldBackgroundColor: Colors.transparent,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      centerTitle: true,
      titleTextStyle: TextStyles.body1,
      ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.transparent,
      filled: true,
      hintStyle: TextStyles.body3.copyWith(color: AppColors.grayScale60),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),
      
    ),
  );
}
