import 'package:flutter/material.dart';
import 'package:meal_prep/core/extensions/text_styles.dart';
import 'package:meal_prep/core/extensions/theme_colors.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarMonthWidget extends StatelessWidget {
  const CalendarMonthWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: DateTime.now(),
      calendarFormat: CalendarFormat.month,
      rowHeight: 40,
      daysOfWeekHeight: 16,
      headerStyle: HeaderStyle(
        headerPadding: const EdgeInsets.symmetric(vertical: 0.0),
        titleTextStyle: context.heading ??
            const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
        formatButtonVisible: false,
        leftChevronIcon: Icon(
          Icons.chevron_left,
          color: context.buttonColor,
        ),
        rightChevronIcon: Icon(
          Icons.chevron_right,
          color: context.buttonColor,
        ),
      ),
      calendarStyle: CalendarStyle(
        selectedDecoration: BoxDecoration(
          color: context.primary,
          shape: BoxShape.circle,
        ),
        todayDecoration: BoxDecoration(
          color: context.onSecondary,
          shape: BoxShape.circle,
        ),
        todayTextStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: context.onPrimary,
        ),
        defaultTextStyle: context.title ?? const TextStyle(),
      ),
    );
  }
}
