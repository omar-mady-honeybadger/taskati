import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/constants/app_assets.dart';
import 'package:taskati/core/style/app_colors.dart';
import 'package:taskati/core/style/box_decoration.dart';
import 'package:taskati/core/style/text_styles.dart';

class TasksListView extends StatelessWidget {
  const TasksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 5,
      separatorBuilder: (BuildContext context, int index) {
        return Gap(12);
      },
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: const EdgeInsets.all(12),
          decoration: AppBoxDecoration.defaultDecoration,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Title Of Task',
                style: TextStyles.body3.copyWith(fontWeight: FontWeight.w400),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Gap(6),
              Text(
                'Description Description Description Description Description Description Description Description Description',
                style: TextStyles.body4.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColors.secondary,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Gap(12),
              Row(
                children: [
                  SvgPicture.asset(
                    AppAssets.timeCircleSvg,
                    width: 16,
                    height: 16,
                  ),
                  Gap(6),
                  Text(
                    '10:00 AM - 12:00 PM',
                    style: TextStyles.body4.copyWith(
                      color: AppColors.lightPurple,
                    ),
                  ),
                  Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.lightOrange,
                    ),
                    child: Text(
                      'In Progress',
                      style: TextStyles.body5.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.orange,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
