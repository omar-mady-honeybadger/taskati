import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/style/app_colors.dart';

void showErrorDialog(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: AppColors.error,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      content: Row(
        children: [
          const Icon(Icons.error, color: Colors.white),
          const Gap(4),
          Expanded(child: Text(message,)),
        ],
      ),
    ),
  );
}
