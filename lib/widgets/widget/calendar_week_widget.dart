import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:meal_prep/core/extensions/text_styles.dart';
import 'package:meal_prep/core/extensions/theme_colors.dart';

class CalendarWeekWidget extends StatelessWidget {
  final DateTime focusDate;
  final void Function(DateTime) onDateChange;
  final EasyInfiniteDateTimelineController controller;

  const CalendarWeekWidget({
    Key? key,
    required this.focusDate,
    required this.onDateChange,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasyInfiniteDateTimeLine(
      selectionMode: const SelectionMode.alwaysFirst(),
      controller: controller,
      firstDate: DateTime.now(),
      focusDate: focusDate,
      lastDate: DateTime(2024, 12, 31),
      onDateChange: onDateChange,
      showTimelineHeader: false,
      dayProps: EasyDayProps(
        dayStructure: DayStructure.dayStrDayNum,
        activeDayStyle: DayStyle(
          dayStrStyle: context.subHeading?.apply(
            fontSizeFactor: 0.8,
            color: context.onPrimary,
          ),
          dayNumStyle: context.body?.apply(
            color: context.onPrimary,
          ),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(60)),
            color: context.primary,
          ),
        ),
        inactiveDayStyle: DayStyle(
          dayStrStyle: context.subHeading?.apply(
            fontSizeFactor: 0.8,
          ),
          dayNumStyle: context.body,
          decoration: BoxDecoration(
            color: context.onPrimary,
            border: Border.all(
              color: context.border,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(40),
            ),
          ),
        ),
        todayStyle: DayStyle(
          dayStrStyle: context.subHeading?.apply(
            color: context.primary,
            fontSizeFactor: 0.8,
          ),
          dayNumStyle: context.body?.apply(
            color: context.primary,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: context.primary.withOpacity(0.5),
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(40),
            ),
          ),
        ),
        width: 45,
        height: 70,
      ),
    );
  }
}
