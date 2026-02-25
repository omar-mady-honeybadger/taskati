import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskati/core/constants/app_assets.dart';
import 'package:taskati/core/style/app_colors.dart';
import 'package:taskati/core/style/box_decoration.dart';
import 'package:taskati/core/style/text_styles.dart';

class DateTimeCard extends StatelessWidget {
  const DateTimeCard({
    super.key,
    required this.label,
    required this.value,
    required this.path,
    required this.onTap,
  });

  final String label;
  final String value;
  final String path;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
        decoration: AppBoxDecoration.defaultDecoration,
        child: ListTile(
          minVerticalPadding: 0,
          minTileHeight: 0,
          leading: SvgPicture.asset(path),
          title: Text(
            label,
            style: TextStyles.body5.copyWith(
              color: AppColors.secondary,
              fontWeight: FontWeight.w400,
            ),
          ),
          subtitle: Text(
            value,
            style: TextStyles.body3.copyWith(fontWeight: FontWeight.w400),
          ),
          trailing: SvgPicture.asset(AppAssets.arrowDownSvg),
        ),
      ),
    );
  }
}
