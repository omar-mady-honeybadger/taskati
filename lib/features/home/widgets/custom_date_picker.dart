import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:taskati/core/style/app_colors.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({
    super.key,
  });

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  final DatePickerController controller = DatePickerController();

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 500), (){
      controller.jumpToSelection();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return DatePicker(
      height: 88,
      width: 64,
      DateTime.now().subtract(Duration(days: 30)),
      initialSelectedDate: DateTime.now(),
      controller: controller,
      deactivatedColor: Colors.white,
      selectionColor: AppColors.primary,
      selectedTextColor: Colors.white,
      onDateChange: (date) {},
    );
  }
}
