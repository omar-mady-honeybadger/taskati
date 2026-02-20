import 'package:flutter/material.dart';
import 'package:taskati/core/style/app_colors.dart';

class TextStyles {
  static const double _defaultLetterSpacing = 0.5;

  static TextStyle h1 = TextStyle(
    fontSize: 24,
    color: AppColors.black,
    fontWeight: FontWeight.w700,
    letterSpacing: _defaultLetterSpacing,
  );
  static TextStyle h2 = TextStyle(
    fontSize: 20,
    color: AppColors.black,
    fontWeight: FontWeight.w700,
    letterSpacing: _defaultLetterSpacing,
  );
  static TextStyle body1 = TextStyle(
    fontSize: 18,
    color: AppColors.black,
    fontWeight: FontWeight.w600,
    letterSpacing: _defaultLetterSpacing,
  );

  static TextStyle body2 = TextStyle(
    fontSize: 16,
    color: AppColors.black,
    fontWeight: FontWeight.w600,
    letterSpacing: _defaultLetterSpacing,
  );

  static TextStyle body3 = TextStyle(
    fontSize: 14,
    color: AppColors.black,
    fontWeight: FontWeight.w600,
    letterSpacing: _defaultLetterSpacing,
  );
  static TextStyle body4 = TextStyle(
    fontSize: 12,
    color: AppColors.black,
    fontWeight: FontWeight.w600,
    letterSpacing: _defaultLetterSpacing,
  );
  static TextStyle body5 = TextStyle(
    fontSize: 10,
    color: AppColors.black,
    fontWeight: FontWeight.w600,
    letterSpacing: _defaultLetterSpacing,
  );
}
