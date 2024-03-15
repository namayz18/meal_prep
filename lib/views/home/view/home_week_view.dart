import 'package:flutter/material.dart';
import 'package:meal_prep/models/meal.dart';
import 'package:meal_prep/views/home/widgets/calendar_title_widget.dart';
import 'package:meal_prep/widgets/card/meal_small_card.dart';
import 'package:meal_prep/widgets/text/custom_heading_text.dart';

class HomeWeekView extends StatelessWidget {
  final DateTime focusDate;
  final void Function(DateTime) onDateChange;
  final VoidCallback onPressCalendar;
  const HomeWeekView({
    Key? key,
    required this.focusDate,
    required this.onDateChange,
    required this.onPressCalendar,
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
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: mealList.length,
          itemBuilder: (BuildContext context, int index) {
            return MealSmallCard(
              meal: mealList[index],
            );
          },
        ),
        const SizedBox(height: 16),
        const CustomHeadingText(title: 'Tomorrow'),
        const SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: mealList.length,
          itemBuilder: (BuildContext context, int index) {
            return MealSmallCard(
              meal: mealList[index],
            );
          },
        ),
      ],
    );
  }
}
