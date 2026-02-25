import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:taskati/core/style/app_colors.dart';
import 'package:taskati/core/style/text_styles.dart';

class DailyProgress extends StatelessWidget {
  const DailyProgress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.primary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat('EEEE, dd MMM').format(DateTime.now()),
                  style: TextStyles.body3.copyWith(
                    color: AppColors.accent,
                  ),
                ),
                Gap(12),
                Text(
                  'Your today’s task almost Done',
                  style: TextStyles.body3.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Gap(30),
          CircularPercentIndicator(
            radius: 38.0,
            lineWidth: 8.0,
            percent: 0.85,
            center: Text(
              "85%",
              style: TextStyles.body3.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
            animation: true,
            animationDuration: 1000,
            circularStrokeCap: CircularStrokeCap.round,
            backgroundColor: Color(0xff8764FF),
            progressColor: AppColors.background,
          ),
        ],
      ),
    );
  }
}
