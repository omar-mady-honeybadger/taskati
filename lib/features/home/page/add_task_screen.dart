import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/constants/app_assets.dart';
import 'package:taskati/core/functions/navigations.dart';
import 'package:taskati/core/models/task_model.dart';
import 'package:taskati/core/services/hive_helper.dart';
import 'package:taskati/core/style/text_styles.dart';
import 'package:taskati/core/widgets/custom_text_form_field.dart';
import 'package:taskati/core/widgets/main_button.dart';
import 'package:taskati/features/home/page/home_screen.dart';
import 'package:taskati/features/home/widgets/date_time_card.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final titleController = TextEditingController();
  final descController = TextEditingController();

  String date = DateFormat('dd MMM, yyy').format(DateTime.now());
  String startTime = DateFormat('hh:mm a').format(DateTime.now());
  String endTime = DateFormat(
    'hh:mm a',
  ).format(DateTime.now().add(Duration(hours: 1)));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(AppAssets.arrowLeftSvg),
        ),
        title: Text('Add Task', style: TextStyles.body1),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            children: [
              Gap(18),
              CustomTextFormField(
                label: 'Title',
                hintText: 'Task title',
                controller: titleController,
              ),
              Gap(18),
              CustomTextFormField(
                label: 'Description',
                hintText: 'Task description',
                controller: descController,
                minLines: 4,
                maxLines: 4,
              ),
              Gap(50),
              DateTimeCard(
                label: 'Date',
                value: date,
                path: AppAssets.calendarSvg,
                onTap: () async {
                  var selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(Duration(days: 1460)),
                  );
                  if (selectedDate != null) {
                    setState(() {
                      date = DateFormat('dd MMM, yyy').format(selectedDate);
                    });
                  }
                },
              ),
              Gap(24),
              DateTimeCard(
                label: 'Start Time',
                value: startTime,
                path: AppAssets.timeCircleSvg,
                onTap: () async {
                  var selectedStartTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (selectedStartTime != null) {
                    setState(() {
                      startTime = selectedStartTime.format(context);
                    });
                  }
                },
              ),
              Gap(24),
              DateTimeCard(
                label: 'End Time',
                value: endTime,
                path: AppAssets.timeCircleSvg,
                onTap: () async {
                  var selectedEndTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (selectedEndTime != null) {
                    setState(() {
                      endTime = selectedEndTime.format(context);
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(22.0),
        child: MainButton(
          text: "Add Task",
          onPress: () {
            String id = DateTime.now().toString();
            HiveHelper.cacheTask(
              id,
              TaskModel(
                id: id,
                title: titleController.text,
                description: descController.text,
                date: date,
                startTime: startTime,
                endTime: endTime,
                isCompleted: false,
              ),
            );
            replaceWith(context,HomeScreen());
          },
        ),
      ),
    );
  }
}
