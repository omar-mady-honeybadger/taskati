import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/functions/navigations.dart';
import 'package:taskati/core/models/task_model.dart';
import 'package:taskati/core/services/hive_helper.dart';
import 'package:taskati/core/style/app_colors.dart';
import 'package:taskati/features/add_task/page/add_task_screen.dart';
import 'package:taskati/features/home/widgets/custom_date_picker.dart';
import 'package:taskati/features/home/widgets/daily_progress.dart';
import 'package:taskati/features/home/widgets/home_header.dart';
import 'package:taskati/features/home/widgets/task/build_tab.dart';
import 'package:taskati/features/home/widgets/task/task_list_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.now();
  int currentTab = 0;

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
                          CustomDatePicker(
                            onDateChange: (date) {
                              setState(() {
                                selectedDate = date;
                              });
                            },
                          ),
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
            child: Expanded(
              child: DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    TabBar(
                      dividerColor: Colors.transparent,
                      indicatorColor: Colors.transparent,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelPadding: const EdgeInsets.symmetric(horizontal: 5),
                      onTap: (index) {
                        setState(() {
                          currentTab = index;
                        });
                      },
                      tabs: [
                        BuildTab(label: 'All', isSelected: currentTab == 0),
                        BuildTab(
                          label: 'In Progress',
                          isSelected: currentTab == 1,
                        ),
                        BuildTab(
                          label: 'Completed',
                          isSelected: currentTab == 2,
                        ),
                      ],
                    ),
                    Gap(22),
                    Expanded(
                      child: ValueListenableBuilder(
                        valueListenable: HiveHelper.tasksBox.listenable(),
                        builder: (BuildContext context, box, child) {
                          List<TaskModel> dailyTasks = [];
                          List<TaskModel> inProgressTasks = [];
                          List<TaskModel> completedTasks = [];

                          for (var task in box.values) {
                            if (task.date ==
                                DateFormat(
                                  'dd MMM, yyy',
                                ).format(selectedDate)) {
                              dailyTasks.add(task);
                              if (task.isCompleted == true) {
                                completedTasks.add(task);
                              } else {
                                inProgressTasks.add(task);
                              }
                            }
                          }

                          return TabBarView(
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              TasksListView(tasks: dailyTasks),
                              TasksListView(tasks: inProgressTasks),
                              TasksListView(tasks: completedTasks),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pushTo(context, AddEditTaskScreen());
        },
        backgroundColor: AppColors.primary,
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        child: Icon(Icons.add_rounded, color: Colors.white, size: 28),
      ),
    );
  }
}