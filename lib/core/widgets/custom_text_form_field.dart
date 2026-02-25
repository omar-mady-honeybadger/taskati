import 'package:flutter/material.dart';
import 'package:taskati/core/style/app_colors.dart';
import 'package:taskati/core/style/text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.label,
    this.hintText,
    this.minLines = 1,
    this.maxLines = 1,
    this.validator,
    this.onTap,
    this.keyboardType,
    this.controller,
    this.enabled = true,
  });

  final String label;
  final String? hintText;
  final int minLines;
  final int maxLines;
  final bool enabled;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Function()? onTap;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyles.body4.copyWith(
            color: AppColors.secondary,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                offset: const Offset(0, 4),
                blurRadius: 32,
              ),
            ],
          ),
          child: TextFormField(
            minLines: minLines,
            maxLines: maxLines,
            controller: controller,
            keyboardType: keyboardType,
            onTapOutside: (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            decoration: InputDecoration(hintText: hintText, enabled: enabled),
            validator: validator,
            onTap: onTap,
          ),
        ),
      ],
    );
  }
}
