import 'package:flutter/material.dart';
import 'package:taskati/core/style/app_colors.dart';

class AppBoxDecoration {
  static BoxDecoration defaultDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: AppColors.primary.withValues(alpha: 0.1),
        blurRadius: 5,
        offset: const Offset(0, 3),
      ),
    ],
  );
}