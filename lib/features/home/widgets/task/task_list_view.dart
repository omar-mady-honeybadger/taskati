import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/constants/app_assets.dart';
import 'package:taskati/core/functions/navigations.dart';
import 'package:taskati/core/models/task_model.dart';
import 'package:taskati/core/services/hive_helper.dart';
import 'package:taskati/core/style/app_colors.dart';
import 'package:taskati/core/style/box_decoration.dart';
import 'package:taskati/core/style/text_styles.dart';
import 'package:taskati/features/add_task/page/add_task_screen.dart';

class TasksListView extends StatelessWidget {
  const TasksListView({super.key, required this.tasks});

  final List<TaskModel> tasks;

  @override
  Widget build(BuildContext context) {
    if(tasks.isEmpty){return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(AppAssets.searchImmJson),
          Text('No tasks found'),
        ],
      ),
    );}
    return ListView.separated(
      itemCount: tasks.length,
      separatorBuilder: (BuildContext context, int index) {
        return Gap(12);
      },
      itemBuilder: (BuildContext context, int index) {
        TaskModel task = tasks[index];
        return Slidable(
          key: UniqueKey(),
          startActionPane: ActionPane(
            motion: const ScrollMotion(),
            dismissible: DismissiblePane(
              onDismissed: () {
                HiveHelper.tasksBox.delete(task.id ?? '');
              },
            ),
            children: [
              SlidableAction(
                onPressed: (context) {
                  HiveHelper.tasksBox.delete(task.id ?? '');
                },
                backgroundColor: Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
            ],
          ),
          endActionPane: ActionPane(
            motion: ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (context) {
                  HiveHelper.cacheTask(
                    task.id ?? '',
                    task.copyWith(isCompleted: true),
                  );
                },
                backgroundColor: Color(0xFF7BC043),
                foregroundColor: Colors.white,
                icon: Icons.check,
                label: 'Complete',
              ),
              SlidableAction(
                onPressed: (context) {
                  pushTo(context, AddEditTaskScreen(task: task,));
                },
                backgroundColor: Color(0xFF0392CF),
                foregroundColor: Colors.white,
                icon: Icons.edit,
                label: 'edit',
              ),
            ],
          ),
          child: TaskCard(task: task),
        );
      },
    );
  }
}

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.task});

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: AppBoxDecoration.defaultDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            task.title ?? '',
            style: TextStyles.body3.copyWith(fontWeight: FontWeight.w400),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Gap(6),
          Text(
            task.description ?? '',
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
              SvgPicture.asset(AppAssets.timeCircleSvg, width: 16, height: 16),
              Gap(6),
              Text(
                '${task.startTime ?? ''} - ${task.endTime ?? ''}',
                style: TextStyles.body4.copyWith(color: AppColors.lightPurple),
              ),
              Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: task.isCompleted == true
                      ? AppColors.lightPurple
                      : AppColors.lightOrange,
                ),
                child: Text(
                  task.isCompleted == true ? 'Done' : 'In Progress',
                  style: TextStyles.body5.copyWith(
                    fontWeight: FontWeight.w500,
                    color: task.isCompleted == true
                        ? AppColors.primary
                        : AppColors.orange,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
