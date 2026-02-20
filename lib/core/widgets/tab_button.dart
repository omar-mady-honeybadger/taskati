import 'package:flutter/material.dart';
import 'package:taskati/core/style/app_colors.dart';
import 'package:taskati/core/style/text_styles.dart';

class TabButton extends StatelessWidget {
  const TabButton({super.key, required this.text, required this.onPress});

  final String text;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.accent,
        minimumSize: Size(126, 35),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
      ),
      onPressed: () => onPress(),
      child: Text(
        text,
        style: TextStyles.body3.copyWith(
          color: AppColors.primary,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
