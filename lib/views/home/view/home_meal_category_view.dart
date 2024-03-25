import 'package:flutter/material.dart';
import 'package:meal_prep/core/extensions/theme_colors.dart';
import 'package:meal_prep/views/home/controller/home_view_controller.dart';
import 'package:meal_prep/views/home/widgets/meal_category_widget.dart';

class HomeMealCategoryView extends StatelessWidget {
  final HomeViewController controller;

  const HomeMealCategoryView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 16,
          color: context.border,
        ),
        MealCategoryWidget(
          title: 'Breakfast',
          recommendedCalories: '400 kcal',
          time: '7:00 AM',
          meal: controller.getBreakfastMeal(),
        ),
        Container(
          height: 16,
          color: context.border,
        ),
        MealCategoryWidget(
          title: 'Morning Snack',
          recommendedCalories: '400 kcal',
          time: '10:00 AM',
          meal: controller.getBreakfastMeal(),
        ),
        Container(
          height: 16,
          color: context.border,
        ),
        MealCategoryWidget(
          title: 'Lunch',
          recommendedCalories: '400 kcal',
          time: '1:00 PM',
          meal: controller.getBreakfastMeal(),
        ),
        Container(
          height: 16,
          color: context.border,
        ),
        MealCategoryWidget(
          title: 'Afternoon Snack',
          recommendedCalories: '400 kcal',
          time: '4:00 PM',
          meal: controller.getBreakfastMeal(),
        ),
        Container(
          height: 16,
          color: context.border,
        ),
        MealCategoryWidget(
          title: 'Dinner',
          recommendedCalories: '400 kcal',
          time: '7:00 PM',
          meal: controller.getBreakfastMeal(),
        ),
      ],
    );
  }
}
