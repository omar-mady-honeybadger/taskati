import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/models/task_model.dart';
import 'package:taskati/core/services/hive_helper.dart';
import 'package:taskati/features/home/widgets/task/build_tab.dart';
import 'package:taskati/features/home/widgets/task/task_list_view.dart';

class TaskBuilder extends StatefulWidget {
  const TaskBuilder({super.key});

  @override
  State<TaskBuilder> createState() => _TaskBuilderState();
}

class _TaskBuilderState extends State<TaskBuilder> {
  int currentIndex = 0;
  List<TaskModel> tasks = [];

  @override
  void initState() {
    super.initState();
    tasks = HiveHelper.tasksBox.values.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                  currentIndex = index;
                });
              },
              tabs: [
                BuildTab(label: 'All', isSelected: currentIndex == 0),
                BuildTab(label: 'In Progress', isSelected: currentIndex == 1),
                BuildTab(label: 'Completed', isSelected: currentIndex == 2),
              ],
            ),
            Gap(22),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  TasksListView(tasks: tasks),
                  TasksListView(tasks: tasks),
                  TasksListView(tasks: tasks),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
