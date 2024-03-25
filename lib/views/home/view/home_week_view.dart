import 'package:flutter/material.dart';
import 'package:meal_prep/views/home/controller/home_view_controller.dart';
import 'package:meal_prep/views/home/view/home_meal_category_view.dart';
import 'package:meal_prep/views/home/widgets/calendar_title_widget.dart';
import 'package:meal_prep/widgets/text/custom_heading_text.dart';

class HomeWeekView extends StatelessWidget {
  final DateTime focusDate;
  final void Function(DateTime) onDateChange;
  final VoidCallback onPressCalendar;
  final HomeViewController controller;
  const HomeWeekView({
    Key? key,
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
          title: 'This week',
          onPressCalendar: onPressCalendar,
        ),
        const SizedBox(height: 16),
        const CustomHeadingText(title: 'Today'),
        const SizedBox(height: 8),
        HomeMealCategoryView(controller: controller),
        const SizedBox(height: 16),
        const SizedBox(height: 80),
      ],
    );
  }
}
