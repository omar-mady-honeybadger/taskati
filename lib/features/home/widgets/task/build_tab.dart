import 'package:flutter/material.dart';
import 'package:taskati/core/style/app_colors.dart';
import 'package:taskati/core/style/text_styles.dart';

class BuildTab extends StatelessWidget {
  const BuildTab({
    super.key,
    required this.isSelected,
    required this.label,
  });
  final bool isSelected;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 35,
      child: Container(
        width: double.infinity,
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.accent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyles.body3.copyWith(
              color: isSelected ? Colors.white : AppColors.primary,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
