import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/functions/navigations.dart';
import 'package:taskati/core/style/app_colors.dart';
import 'package:taskati/features/home/page/add_task_screen.dart';
import 'package:taskati/features/home/widgets/custom_date_picker.dart';
import 'package:taskati/features/home/widgets/daily_progress.dart';
import 'package:taskati/features/home/widgets/home_header.dart';
import 'package:taskati/features/home/widgets/task/task_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    HomeHeader(),
                    Padding(
                      padding: const EdgeInsets.all(22.0),
                      child: Column(
                        children: [
                          DailyProgress(),
                          Gap(30),
                          CustomDatePicker(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ];
          },
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: TaskBuilder(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pushTo(context, AddTaskScreen());
        },
        backgroundColor: AppColors.primary,
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        child: Icon(Icons.add_rounded, color: Colors.white, size: 28),
      ),
    );
  }
}
