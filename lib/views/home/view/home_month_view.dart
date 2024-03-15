import 'package:flutter/material.dart';
import 'package:meal_prep/models/meal.dart';
import 'package:meal_prep/widgets/card/meal_small_card.dart';
import 'package:meal_prep/widgets/text/custom_heading_text.dart';
import 'package:meal_prep/widgets/widget/calendar_month_widget.dart';

class HomeMonthView extends StatelessWidget {
  const HomeMonthView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      const CalendarMonthWidget(),
      const SizedBox(height: 16),
      const CustomHeadingText(title: 'Meals'),
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
    ]);
  }
}
