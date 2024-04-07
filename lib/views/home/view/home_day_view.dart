import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:meal_prep/views/home/controller/home_view_controller.dart';
import 'package:meal_prep/views/home/view/home_meal_category_view.dart';
import 'package:meal_prep/views/home/widgets/calendar_title_widget.dart';
import 'package:meal_prep/views/home/widgets/home_stats_widget.dart';
import 'package:meal_prep/widgets/text/custom_heading_text.dart';
import 'package:meal_prep/widgets/widget/calendar_week_widget.dart';

class HomeDayView extends StatelessWidget {
  final String calendarTitle;
  final DateTime focusDate;
  final void Function(DateTime) onDateChange;
  final VoidCallback onPressCalendar;
  final HomeViewController controller;
  final EasyInfiniteDateTimelineController dateTimelineController;

  const HomeDayView({
    Key? key,
    required this.calendarTitle,
    required this.focusDate,
    required this.onDateChange,
    required this.onPressCalendar,
    required this.controller,
    required this.dateTimelineController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomHeadingText(title: 'My Meals'),
        const SizedBox(height: 16),
        Expanded(
          child: ListView(
            children: [
              CalendarWeekWidget(
                focusDate: focusDate,
                onDateChange: onDateChange,
                controller: dateTimelineController,
              ),
              const SizedBox(height: 16),
              const HomeStatsWidget(),
              const SizedBox(height: 16),
              HomeMealCategoryView(controller: controller),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ],
    );
  }
}
