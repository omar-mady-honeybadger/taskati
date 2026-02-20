import 'package:flutter/material.dart';
import 'package:taskati/core/style/app_colors.dart';
import 'package:taskati/core/style/text_styles.dart';

class MainButton extends StatelessWidget {
  const MainButton({super.key, required this.text, required this.onPress});

  final String text;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        minimumSize: Size(double.infinity, 48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
      onPressed: () => onPress(),
      child: Text(text, style: TextStyles.body1.copyWith(color: Colors.white)),
    );
  }
}
