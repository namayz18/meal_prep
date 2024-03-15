import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:meal_prep/views/home/widgets/add_meal_widget.dart';
import 'package:meal_prep/views/home/widgets/calendar_title_widget.dart';
import 'package:meal_prep/views/home/widgets/home_stats_widget.dart';
import 'package:meal_prep/widgets/widget/calendar_week_widget.dart';

class HomeDayView extends StatelessWidget {
  final String calendarTitle;
  final DateTime focusDate;
  final void Function(DateTime) onDateChange;
  final VoidCallback onPressCalendar;
  final EasyInfiniteDateTimelineController controller;

  const HomeDayView({
    Key? key,
    required this.calendarTitle,
    required this.focusDate,
    required this.onDateChange,
    required this.onPressCalendar,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CalendarTitleWidget(
          title: calendarTitle,
          onPressCalendar: onPressCalendar,
        ),
        const SizedBox(height: 8),
        CalendarWeekWidget(
          focusDate: focusDate,
          onDateChange: onDateChange,
          controller: controller,
        ),
        const SizedBox(height: 16),
        const HomeStatsWidget(),
        const AddMealWidget(),
      ],
    );
  }
}
